import 'package:online_exam_app/core/errors/failures.dart';
import 'package:online_exam_app/presentation/features/auth/domain/entities/forget_password_response_entity.dart';

sealed class ForgetPasswordStates {}

class ForgetPasswordInitialState extends ForgetPasswordStates {}

class ForgetPasswordLoadingState extends ForgetPasswordStates {}

class ForgetPasswordSuccessState extends ForgetPasswordStates {
  ForgetPasswordResponseEntity forgetPasswordResponseEntity;
  ForgetPasswordSuccessState({required this.forgetPasswordResponseEntity});
}

class ForgetPasswordErrorState extends ForgetPasswordStates {
  Failures failures;
  ForgetPasswordErrorState({required this.failures});
}
