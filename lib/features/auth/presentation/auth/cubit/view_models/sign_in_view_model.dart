import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/api_result/api_result.dart';
import '../../../../data/local/auth_local_data_source.dart';
import '../../../../domain/entities/request_entities/sign_in_request_entity.dart';
import '../../../../domain/entities/response_entities/sign_in_response_entity.dart';
import '../../../../domain/usecases/sign_in_use_case.dart';
import '../states/sign_in_state.dart';

@injectable
class SignInViewModel extends Cubit<SignInState> {
  final SignInUseCase _signInUseCase;
  final AuthLocalDataSource _authLocalDataSource;

  SignInViewModel({
    required SignInUseCase signInUseCase,
    required AuthLocalDataSource authLocalDataSource,
  })  : _signInUseCase = signInUseCase,
        _authLocalDataSource = authLocalDataSource,
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
    final controllers = [signInEmailController, signInPasswordController];
    for (final controller in controllers) {
      controller.addListener(_validateForm);
    }
  }

  Future<void> logout() async {
    await _authLocalDataSource.clearToken();
    await _authLocalDataSource.saveRememberMe(false);
    emit(const SignInState()); // Reset to initial state
  }

  void _validateForm() {
    final isValid = formKey.currentState?.validate() == true;
    emit(state.copyWith(isFormValid: isValid));
  }

  Future<void> toggleRememberMe(bool value) async {
    await _authLocalDataSource.saveRememberMe(value);
    emit(state.copyWith(rememberMe: value, response: null, errorMsg: null));
  }

  void _loadSavedCredentials() async {
    final token = await _authLocalDataSource.getToken();
    final storedRememberMe = await _authLocalDataSource.getRememberMe();
    final userName = await _authLocalDataSource.getUserName();

    if (token != null && token.isNotEmpty && storedRememberMe) {
      emit(state.copyWith(
        rememberMe: storedRememberMe,
        status: SignInStatus.autoAuthenticated,
        userName: userName,
      ));
    } else {
      emit(state.copyWith(
        rememberMe: storedRememberMe,
        status: SignInStatus.initial,
        userName: userName,
      ));
    }
  }

  Future<void> clearAutoAuthentication() async {
    await _authLocalDataSource.clearToken();
    await _authLocalDataSource.saveRememberMe(false);
    await _authLocalDataSource.clearUserName();

    emit(state.copyWith(
      status: SignInStatus.initial,
      rememberMe: false,
      response: null,
      errorMsg: null,
    ));

    signInEmailController.clear();
    signInPasswordController.clear();
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
        final userName = result.data.user.firstName;
        await _authLocalDataSource.saveUserName(userName);

        await _authLocalDataSource.saveRememberMe(state.rememberMe);

        emit(state.copyWith(
          response: result.data,
          errorMsg: null,
          status: SignInStatus.success,
          userName: userName,
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
