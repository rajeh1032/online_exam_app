import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/api_result/api_result.dart';
import 'package:online_exam_app/features/home_screen/tabs/profile_tab/domain/entities/request/change_password_request_entity.dart';
import 'package:online_exam_app/features/home_screen/tabs/profile_tab/domain/entities/response/change_password_response_entity.dart';

import '../../domain/usecases/change_password_use_case.dart';
import 'change_password_states.dart';

@injectable
class ChangePasswordViewModel extends Cubit<ChangePasswordState> {
  final ChangePasswordUseCase _changePasswordUseCase;

  ChangePasswordViewModel(this._changePasswordUseCase)
      : super(const ChangePasswordState()) {
    _addListenersToControllers();
  }

  final TextEditingController currentPasswordController =
      TextEditingController();

  final TextEditingController newPasswordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void _addListenersToControllers() {
    final controllers = [
      currentPasswordController,
      newPasswordController,
      confirmPasswordController,
    ];
    for (final controller in controllers) {
      controller.addListener(_validateForm);
    }
  }

  void _validateForm() {
    final isValid = formKey.currentState?.validate() == true;
    emit(state.copyWith(isFormValid: isValid));
  }

  Future<void> changePassword() async {
    if (formKey.currentState?.validate() != true) {
      emit(state.copyWith(isFormValid: false));
      return;
    }
    emit(state.copyWith(status: ChangePasswordStatus.loading));

    final result = await _changePasswordUseCase(
      ChangePasswordRequestEntity(
        oldPassword: currentPasswordController.text,
        password: newPasswordController.text,
        rePassword: confirmPasswordController.text,
      ),
    );

    switch (result) {
      case ApiSuccessResult<ChangePasswordResponseEntity>():
        emit(state.copyWith(
          status: ChangePasswordStatus.success,
          response: result.data,
          errorMsg: null,
          isFormValid: false,

        ));
      case ApiErrorResult<ChangePasswordResponseEntity>():
        emit(state.copyWith(
          status: ChangePasswordStatus.error,
          errorMsg: result.errorMsg,
        ));
    }
  }


}
