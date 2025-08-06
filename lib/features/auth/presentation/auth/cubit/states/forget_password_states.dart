
import 'package:equatable/equatable.dart';
import 'package:online_exam_app/features/auth/domain/entities/response_entities/forget_password_response_entity.dart';
enum ForgetPasswordStatus { initial, loading, success, error }
class ForgetPasswordStates extends Equatable {

  final String? errorMsg;
  final bool isFormValid;
  final ForgetPasswordStatus status;
  final ForgetPasswordResponseEntity ? response;
  final String? email;

  const ForgetPasswordStates({
    this.errorMsg,
    this.status = ForgetPasswordStatus.initial,
    this.isFormValid = false,
    this.response,
    this.email,
  });

  ForgetPasswordStates copyWith({
    String? errorMsg,
    ForgetPasswordStatus? status,
    bool? isFormValid,
    ForgetPasswordResponseEntity? response,
     String? email,
  }) {
    return ForgetPasswordStates(
      status: status ?? this.status,
      errorMsg: errorMsg ?? this.errorMsg,
      isFormValid: isFormValid ?? this.isFormValid,
      response: response ?? this.response,
      email: email ?? this.email,
    );
  }

  @override
  List<Object?> get props => [errorMsg, status, isFormValid, response, email];
}