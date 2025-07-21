import 'package:online_exam_app/core/errors/failures.dart';
import 'package:online_exam_app/presentation/features/auth/domain/entities/reset_password_response_entity.dart';

sealed class ResetPasswordStates {}

class ResetPasswordInitialState extends ResetPasswordStates {}

class ResetPasswordLoadingState extends ResetPasswordStates {}

class ResetPasswordSuccessState extends ResetPasswordStates {
  ResetPasswordResponseEntity resetPasswordResponseEntity;
  ResetPasswordSuccessState({required this.resetPasswordResponseEntity});
}

class ResetPasswordErrorState extends ResetPasswordStates {
  Failures failures;
  ResetPasswordErrorState({required this.failures});
}
