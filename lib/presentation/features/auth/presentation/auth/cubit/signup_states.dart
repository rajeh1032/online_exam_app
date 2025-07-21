import '../../../../../../core/errors/failures.dart';
import '../../../domain/entities/sign_up_response_entity.dart';

abstract class SignUpStates {}

class SignUpInitialState extends SignUpStates {}

class SignUpLoadingState extends SignUpStates {}

class SignUpSuccessState extends SignUpStates {
  final SignUpResponseEntity signUpResponseEntity;
  SignUpSuccessState({required this.signUpResponseEntity});
}

class SignUpErrorState extends SignUpStates {
  final Failures failures;
  SignUpErrorState({required this.failures});
}
class SignUpFormValidationState extends SignUpStates{
  final bool isFormValid;
  SignUpFormValidationState({required this.isFormValid});
}