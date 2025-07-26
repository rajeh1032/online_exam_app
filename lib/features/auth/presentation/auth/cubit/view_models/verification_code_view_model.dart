import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/provider/app_config_provider.dart';

import 'package:online_exam_app/features/auth/domain/entities/request_entities/verify_reset_code_request_entity.dart';
import 'package:online_exam_app/features/auth/domain/entities/response_entities/verify_reset_code_response_entity.dart';
import 'package:online_exam_app/features/auth/domain/usecases/verify_reset_code_use_case.dart';

import '../../../../../../core/api_result/api_result.dart';
import '../states/verification_code_states.dart';

@injectable
class VerificationCodeViewModel extends Cubit<VerificationCodeStates> {
  final VerifyResetCodeUseCase _verifyResetCodeUseCase;
  final AppConfigProvider _appConfigProvider;

  VerificationCodeViewModel({
    required VerifyResetCodeUseCase verifyResetCodeUseCase,
    required AppConfigProvider appConfigProvider,
  })  : _verifyResetCodeUseCase = verifyResetCodeUseCase,
        _appConfigProvider = appConfigProvider,
        super(const VerificationCodeStates()) {
    _initializeControllers();
    _addListenersToControllers();
  }

  final formKey = GlobalKey<FormState>();

  late final TextEditingController codeController;

  void _initializeControllers() {
    codeController = TextEditingController();
  }

  void _addListenersToControllers() {
    codeController.addListener(_validateForm);
  }

  void _validateForm() {
    final isValid = formKey.currentState?.validate() == true;
    emit(state.copyWith(isFormValid: isValid));
  }

  Future<void> verifyCode() async {
    if (formKey.currentState?.validate() == true) {
      emit(state.copyWith(
        errorMsg: null,
        status: VerificationCodeStatus.loading,
      ));

      final request =
      VerifyResetCodeRequestEntity(resetCode: codeController.text);

      final result = await _verifyResetCodeUseCase.invoke(request);

      _handleResult(result);
    }
  }

  void _handleResult(ApiResult<VerifyResetCodeResponseEntity> result) {
    switch (result) {
      case ApiSuccessResult<VerifyResetCodeResponseEntity>():
        emit(state.copyWith(
          response: result.data,
          errorMsg: null,
          status: VerificationCodeStatus.success,
        ));
        break;

      case ApiErrorResult<VerifyResetCodeResponseEntity>():
        emit(state.copyWith(
          errorMsg: result.errorMsg,
          status: VerificationCodeStatus.error,
        ));
        break;
    }
  }

  void _disposeControllers() {
    codeController.dispose();
  }

  @override
  Future<void> close() {
    _disposeControllers();
    return super.close();
  }


  String get email=> _appConfigProvider.getUserEmail() ?? '';

}


