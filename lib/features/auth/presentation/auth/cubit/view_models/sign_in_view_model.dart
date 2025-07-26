
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/api_result/api_result.dart';
import '../../../../../../core/provider/app_config_provider.dart';
import '../../../../domain/entities/request_entities/sign_in_request_entity.dart';
import '../../../../domain/entities/response_entities/sign_in_response_entity.dart';
import '../../../../domain/usecases/sign_in_use_case.dart';
import '../states/sign_in_state.dart';


@injectable
class SignInViewModel extends Cubit<SignInState> {
  final SignInUseCase _signInUseCase;
  final AppConfigProvider _appConfig;

  SignInViewModel(
      {required SignInUseCase signInUseCase,
      required AppConfigProvider appConfigProvider})
      : _signInUseCase = signInUseCase,
        _appConfig = appConfigProvider,
        super(const SignInState()) {
    _controllerInitiate();
    _loadSavedCredentials();
    _addListenersToControllers();
  }

  final formKey = GlobalKey<FormState>();
  late final TextEditingController signInEmailController;
  late final TextEditingController signInPasswordController;

  void _controllerInitiate() {
    signInEmailController = TextEditingController();
    signInPasswordController = TextEditingController();
  }

  void _addListenersToControllers() {
    final controllers = [
      signInEmailController,
      signInPasswordController
    ];
    for (final controller in controllers) {
      controller.addListener(_validateForm);
    }

  }
  void _validateForm() {
    final isValid = formKey.currentState?.validate() == true;
    emit(state.copyWith(isFormValid: isValid));
  }

  void toggleRememberMe(bool value) {
    emit(state.copyWith(rememberMe: value, response: null, errorMsg: null));
  }

  void _loadSavedCredentials() {
    if (_appConfig.isRemembered) {
      signInEmailController.text = _appConfig.savedEmail ?? '';
      signInPasswordController.text = _appConfig.savedPassword ?? '';
      emit(state.copyWith(rememberMe: true));
    } else {
      _appConfig.clearRememberMe();
    }
  }

  Future<void> signIn() async {
    if (formKey.currentState?.validate() == true) {
      emit(state.copyWith(
        errorMsg: null,
        status: SignInStatus.loading,
      ));

      final request = SignInRequestEntity(
        email: signInEmailController.text.trim(),
        password: signInPasswordController.text,
      );

      var result = await _signInUseCase.invoke(request);

      _handleSignInResult(result);
    }
  }

  Future<void> _handleSignInResult(
      ApiResult<SignInResponseEntity> result) async {
    switch (result) {
      case ApiSuccessResult<SignInResponseEntity>():
        if (state.rememberMe) {
          await _appConfig.saveRememberMe(
            email: signInEmailController.text.trim(),
            password: signInPasswordController.text,
          );
        } else {
          signInEmailController.clear();
          signInPasswordController.clear();
        }

        emit(state.copyWith(
          response: result.data,
          errorMsg: null,
          status: SignInStatus.success,
        ));
        break;

      case ApiErrorResult<SignInResponseEntity>():
        emit(state.copyWith(
          errorMsg: result.errorMsg,
          status: SignInStatus.error,
        ));
        break;
    }
  }

  @override
  Future<void> close() {
    signInEmailController.dispose();
    signInPasswordController.dispose();
    return super.close();
  }
}
