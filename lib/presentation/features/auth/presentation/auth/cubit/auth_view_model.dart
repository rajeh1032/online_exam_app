import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/presentation/features/auth/domain/usecases/sign_in_use_case.dart';
import 'package:online_exam_app/presentation/features/auth/presentation/auth/cubit/auth_state.dart';

@injectable
class AuthViewModel extends Cubit<SignInStates> {
  AuthViewModel({required this.signInUseCase}) : super(SignInInitialState());

  SignInUseCase signInUseCase;
  final formKey = GlobalKey<FormState>();

  final TextEditingController emailController =
      TextEditingController(text: "ahmmedra209@gmail.com");

  final TextEditingController passwordController =
      TextEditingController(text: "ahmed123@@R");

  bool rememberMe = false;

  bool opscurePassword = true;

  signIn() async {
    if (formKey.currentState?.validate() == true) {
      emit(SignInLoadingState());
      var either = await signInUseCase.signInInvoke(
        email: emailController.text,
        password: passwordController.text,
      );
      either.fold(
        (error) => emit(SignInErrorState(failures: error)),
        (response) => emit(SignInSuccessState(signInResponseEntity: response)),
      );
    }
  }
}
