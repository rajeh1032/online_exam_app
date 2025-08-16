import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/api_result/api_result.dart';
import '../../../../../../core/provider/remember_me_provider.dart';
import '../../../../../../core/utils/shared_pref_services.dart';
import '../../../../domain/entities/request_entities/sign_in_request_entity.dart';
import '../../../../domain/entities/response_entities/sign_in_response_entity.dart';
import '../../../../domain/usecases/sign_in_use_case.dart';
import '../states/sign_in_state.dart';

@injectable
class SignInViewModel extends Cubit<SignInState> {
  final SignInUseCase _signInUseCase;
  final RememberMeProvider _rememberMeProvider;
  final SharedPrefService _sharedPrefService;

  SignInViewModel({
    required SignInUseCase signInUseCase,
    required RememberMeProvider rememberMeProvider,
   required SharedPrefService sharedPrefService,
  })  : _signInUseCase = signInUseCase,
        _rememberMeProvider = rememberMeProvider,
        _sharedPrefService = sharedPrefService ,
        super(const SignInState()) {
    _controllerInitiate();
    _loadRememberMePreference();
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

  void _validateForm() {
    final isValid = formKey.currentState?.validate() == true;
    emit(state.copyWith(isFormValid: isValid));
  }

  void toggleRememberMe(bool value) {
    _rememberMeProvider.setRememberMe(value);
    emit(state.copyWith(rememberMe: value, response: null, errorMsg: null));
  }

  void _loadRememberMePreference() {
    final isEnabled = _rememberMeProvider.isRememberMeEnabled;
    emit(state.copyWith(rememberMe: isEnabled));
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
        final token = result.data.token;
        if (state.rememberMe) {
          await _sharedPrefService.setToken(token);
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
