import 'package:online_exam_app/core/errors/failures.dart';
import 'package:online_exam_app/features/auth/domain/entities/sign_in_response_entity.dart';

abstract class SignInStates {}

class SignInInitialState extends SignInStates {}

class SignInLoadingState extends SignInStates {}

class SignInSuccessState extends SignInStates {
  SignInResponseEntity signInResponseEntity;
  SignInSuccessState({required this.signInResponseEntity});
}

class SignInErrorState extends SignInStates {
  Failures failures;
  SignInErrorState({required this.failures});
}
