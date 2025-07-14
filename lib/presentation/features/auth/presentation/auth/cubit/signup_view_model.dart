import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/presentation/features/auth/presentation/auth/cubit/signup_states.dart';
import '../../../../../../core/utils/validators.dart';
import '../../../domain/usecases/sign_up_use_case.dart';

@injectable
class SignUpViewModel extends Cubit<SignUpStates> {
  final SignUpUseCase signUpUseCase;

  SignUpViewModel({required this.signUpUseCase}) : super(SignUpInitialState()){
    _initializeControllers();
  }

  late final TextEditingController signUpUsernameController;
  late final TextEditingController signUpFirstNameController;
  late final TextEditingController signUpLastNameController;
  late final TextEditingController signUpEmailController;
  late final TextEditingController signUpPasswordController;
  late final TextEditingController signUpRePasswordController;
  late final TextEditingController signUpPhoneController;

  void _initializeControllers() {
    signUpUsernameController = TextEditingController();
    signUpFirstNameController = TextEditingController();
    signUpLastNameController = TextEditingController();
    signUpEmailController = TextEditingController();
    signUpPasswordController = TextEditingController();
    signUpRePasswordController = TextEditingController();
    signUpPhoneController = TextEditingController();
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
  bool obscurePassword = true;
  bool obscureRePassword = true;
  bool isFormValid=false;

  Future<void> signUp() async {
    if (formKey.currentState?.validate() == true) {
      emit(SignUpLoadingState());
      final result = await signUpUseCase.signUpInvoke(
        username: signUpUsernameController.text,
        firstName: signUpFirstNameController.text,
        lastName: signUpLastNameController.text,
        email: signUpEmailController.text,
        password: signUpPasswordController.text,
        rePassword: signUpRePasswordController.text,
        phone: signUpPhoneController.text,
      );

      result.fold(
        (failure) => emit(SignUpErrorState(failures: failure)),
        (signUpResponse) =>
            emit(SignUpSuccessState(signUpResponseEntity: signUpResponse)),
      );
    }
  }

  void checkFormValidation() {
    List<String?> validationResults = [
      AppValidators.validateUsername(signUpUsernameController.text),
      AppValidators.validateFullName(signUpFirstNameController.text),
      AppValidators.validateFullName(signUpLastNameController.text),
      AppValidators.validateEmail(signUpEmailController.text),
      AppValidators.validatePassword(signUpPasswordController.text),
      AppValidators.validateConfirmPassword(signUpRePasswordController.text, signUpPasswordController.text),
      AppValidators.validatePhoneNumber(signUpPhoneController.text),
    ];

    isFormValid = validationResults.every((result) => result == null);

    emit(SignUpFormValidationState(isFormValid: isFormValid));
  }
}
