import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/local_storage/remember_me_local_data_source.dart';


import 'package:online_exam_app/features/auth/domain/entities/request_entities/reset_password_request_entity.dart';
import 'package:online_exam_app/features/auth/domain/entities/response_entities/reset_password_response_entity.dart';
import 'package:online_exam_app/features/auth/domain/usecases/reset_password_use_case.dart';
import 'package:online_exam_app/features/auth/presentation/auth/cubit/states/reset_password_states.dart';

import '../../../../../../core/api_result/api_result.dart';

@injectable
class ResetPasswordViewModel extends Cubit<ResetPasswordStates> {
  final ResetPasswordUseCase _resetPasswordUseCase;
  final RememberMeLocalDataSource _rememberMeLocalDataSource;

  ResetPasswordViewModel({
    required ResetPasswordUseCase resetPasswordUseCase,
    required RememberMeLocalDataSource rememberMeLocalDataSource,
  })  : _resetPasswordUseCase = resetPasswordUseCase,
        _rememberMeLocalDataSource = rememberMeLocalDataSource,
        super(const ResetPasswordStates()) {
    _initializeControllers();
    _addListenersToControllers();
  }

  final formKey = GlobalKey<FormState>();

  late final TextEditingController newPasswordController;
  late final TextEditingController confirmPasswordController;

  void _initializeControllers() {
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  void _addListenersToControllers() {
    newPasswordController.addListener(_validateForm);
    confirmPasswordController.addListener(_validateForm);
  }

  void _validateForm() {
    final isValid = formKey.currentState?.validate() == true;
    emit(state.copyWith(isFormValid: isValid));
  }


  Future<void> resetPassword({required String email}) async {
    if (formKey.currentState?.validate() == true) {
      emit(state.copyWith(
        errorMsg: null,
        status: ResetPasswordStatus.loading,
      ));

      final request = ResetPasswordRequestEntity(
        email: email,
        newPassword: newPasswordController.text,
      );

      final result = await _resetPasswordUseCase.invoke(request);

      _handleResult(result);
    }
  }

  void _handleResult(ApiResult<ResetPasswordResponseEntity> result) {
    switch (result) {
      case ApiSuccessResult<ResetPasswordResponseEntity>():
        emit(state.copyWith(
          response: result.data,
          errorMsg: null,
          status: ResetPasswordStatus.success,
        ));
        break;

      case ApiErrorResult<ResetPasswordResponseEntity>():
        emit(state.copyWith(
          errorMsg: result.errorMsg,
          status: ResetPasswordStatus.error,
        ));
        break;
    }
  }

  void _disposeControllers() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  Future<void> close() {
    _disposeControllers();
    return super.close();
  }

  Future<String?> get email=>_rememberMeLocalDataSource.getSavedEmail();
}
