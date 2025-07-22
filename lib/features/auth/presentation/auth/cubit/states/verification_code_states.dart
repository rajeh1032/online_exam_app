import 'package:online_exam_app/core/errors/failures.dart';
import 'package:online_exam_app/features/auth/domain/entities/verify_reset_code_response_entity.dart';

sealed class VerificationCodeStates {}

class VerificationCodeInitialState extends VerificationCodeStates {}

class VerificationCodeLoadingState extends VerificationCodeStates {}

class VerificationCodeSuccessState extends VerificationCodeStates {
  VerifyResetCodeResponseEntity verifyResetCodeResponseEntity;
  VerificationCodeSuccessState({required this.verifyResetCodeResponseEntity});
}

class VerificationCodeErrorState extends VerificationCodeStates {
  Failures failures;
  VerificationCodeErrorState({required this.failures});
}
