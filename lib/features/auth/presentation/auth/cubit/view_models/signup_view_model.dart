
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/api_result/api_result.dart';
import '../../../../domain/entities/request_entities/sign_up_request_entity.dart';
import '../../../../domain/entities/response_entities/sign_up_response_entity.dart';
import '../../../../domain/usecases/sign_up_use_case.dart';
import '../states/signup_states.dart';


@injectable
class SignUpViewModel extends Cubit<SignUpState> {
  final SignUpUseCase _signUpUseCase;

  SignUpViewModel({required SignUpUseCase signUpUseCase})
      : _signUpUseCase = signUpUseCase,
        super(const SignUpState()) {
    _initializeControllers();
    _addListenersToControllers();
  }

  late final TextEditingController signUpUsernameController;
  late final TextEditingController signUpFirstNameController;
  late final TextEditingController signUpLastNameController;
  late final TextEditingController signUpEmailController;
  late final TextEditingController signUpPasswordController;
  late final TextEditingController signUpRePasswordController;
  late final TextEditingController signUpPhoneController;

  void _initializeControllers() {
    signUpUsernameController = TextEditingController(text: 'samir');
    signUpFirstNameController = TextEditingController(text:'samir');
    signUpLastNameController = TextEditingController(text:'ali');
    signUpEmailController = TextEditingController(text: 'samir@gmail.com');
    signUpPasswordController = TextEditingController(text: 'Samir@123');
    signUpRePasswordController = TextEditingController(text: 'Samir@123');
    signUpPhoneController = TextEditingController(text: '01020304050');
  }

  void _addListenersToControllers() {
    final controllers = [
      signUpUsernameController,
      signUpFirstNameController,
      signUpLastNameController,
      signUpEmailController,
      signUpPasswordController,
      signUpRePasswordController,
      signUpPhoneController,
    ];

    for (final controller in controllers) {
      controller.addListener(_validateForm);
    }
  }
  void _validateForm() {
    final isValid = formKey.currentState?.validate() == true;
    emit(state.copyWith(isFormValid: isValid));
  }

  void _disposeControllers() {
    signUpUsernameController.dispose();
    signUpFirstNameController.dispose();
    signUpLastNameController.dispose();
    signUpEmailController.dispose();
    signUpPasswordController.dispose();
    signUpRePasswordController.dispose();
    signUpPhoneController.dispose();
  }

  @override
  Future<void> close() {
    _disposeControllers();
    return super.close();
  }

  final formKey = GlobalKey<FormState>();

  Future<void> signUp() async {
    if (formKey.currentState?.validate() == true) {
      emit(state.copyWith(
        errorMsg: null,
        status: SignUpStatus.loading,
      ));

      final request= SignUpRequestEntity(
        username: signUpUsernameController.text,
        firstName: signUpFirstNameController.text,
        lastName: signUpLastNameController.text,
        email: signUpEmailController.text,
        password: signUpPasswordController.text,
        rePassword: signUpRePasswordController.text,
        phone: signUpPhoneController.text,
      );
      var result=await _signUpUseCase.invoke(request);
      _handleResult(result);



    }
  }
  void _handleResult(ApiResult<SignUpResponseEntity> result) {
    switch (result) {
      case ApiSuccessResult<SignUpResponseEntity>():
        emit(state.copyWith(
          response: result.data,
          errorMsg: null,
          status: SignUpStatus.success,
        ));
        break;

      case ApiErrorResult<SignUpResponseEntity>():
        emit(state.copyWith(
          errorMsg: result.errorMsg,
          status: SignUpStatus.error,
        ));
        break;
    }
  }
}
