
import 'package:equatable/equatable.dart';
import 'package:online_exam_app/features/auth/domain/entities/response_entities/verify_reset_code_response_entity.dart';
enum VerificationCodeStatus { initial, loading, success, error }
class VerificationCodeStates extends Equatable{

  final String? errorMsg;
  final bool isFormValid;
  final VerificationCodeStatus status;
  final VerifyResetCodeResponseEntity ? response;

  const VerificationCodeStates({
    this.errorMsg,
    this.status = VerificationCodeStatus.initial,
    this.isFormValid = false,
    this.response,
  });

  VerificationCodeStates copyWith({
    String? errorMsg,
    VerificationCodeStatus? status,
    bool? isFormValid,
    VerifyResetCodeResponseEntity? response,
  }) {
    return VerificationCodeStates(
      status: status ?? this.status,
      errorMsg: errorMsg ?? this.errorMsg,
      isFormValid: isFormValid ?? this.isFormValid,
      response: response ?? this.response,
    );
  }

  @override
  List<Object?> get props => [errorMsg, status, isFormValid, response];
}