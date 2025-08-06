import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/auth/domain/entities/request_entities/forget_password_request_entity.dart';
import 'package:online_exam_app/features/auth/domain/entities/response_entities/forget_password_response_entity.dart';
import 'package:online_exam_app/features/auth/domain/usecases/forget_password_use_case.dart';
import 'package:online_exam_app/features/auth/presentation/auth/cubit/states/forget_password_states.dart';

import '../../../../../../core/api_result/api_result.dart';

@injectable
class ForgetPasswordViewModel extends Cubit<ForgetPasswordStates> {
  final ForgetPasswordUseCase _forgetPasswordUseCase;

  ForgetPasswordViewModel({
    required ForgetPasswordUseCase forgetPasswordUseCase,
  })  : _forgetPasswordUseCase = forgetPasswordUseCase,
        super(const ForgetPasswordStates()) {
    _initializeControllers();
    _addListenersToControllers();
  }

  final formKey = GlobalKey<FormState>();

  late final TextEditingController emailController;

  void _initializeControllers() {
    emailController = TextEditingController();
  }

  void _addListenersToControllers() {
    emailController.addListener(_validateForm);
  }

  void _validateForm() {
    final isValid = formKey.currentState?.validate() == true;
    emit(state.copyWith(isFormValid: isValid));
  }

  void _disposeControllers() {
    emailController.dispose();
  }

  Future<void> forgetPassword() async {
    if (formKey.currentState?.validate() == true) {
      emit(state.copyWith(
        errorMsg: null,
        status: ForgetPasswordStatus.loading,
      ));
      final request = ForgetPasswordRequestEntity(email: emailController.text);
      final result = await _forgetPasswordUseCase.invoke(request);
      _handleResult(result);
    }
  }

  Future<void> resendCode(String email) async {
    final request = ForgetPasswordRequestEntity(email: email);
    await _forgetPasswordUseCase.invoke(request);
  }

  @override
  Future<void> close() {
    _disposeControllers();
    return super.close();
  }

  void _handleResult(ApiResult<ForgetPasswordResponseEntity> result) async {
    switch (result) {
      case ApiSuccessResult<ForgetPasswordResponseEntity>():

        emit(state.copyWith(
          response: result.data,
          errorMsg: null,
          status: ForgetPasswordStatus.success,
          email: emailController.text,
        ));
        break;

      case ApiErrorResult<ForgetPasswordResponseEntity>():
        emit(state.copyWith(
          errorMsg: result.errorMsg,
          status: ForgetPasswordStatus.error,
        ));
        break;
    }
  }
}
