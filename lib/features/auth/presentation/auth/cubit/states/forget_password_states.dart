
import 'package:equatable/equatable.dart';
import 'package:online_exam_app/features/auth/domain/entities/response_entities/forget_password_response_entity.dart';
enum ForgetPasswordStatus { initial, loading, success, error }
class ForgetPasswordStates extends Equatable {

  final String? errorMsg;
  final bool isFormValid;
  final ForgetPasswordStatus status;
  final ForgetPasswordResponseEntity ? response;

  const ForgetPasswordStates({
    this.errorMsg,
    this.status = ForgetPasswordStatus.initial,
    this.isFormValid = false,
    this.response,
  });

  ForgetPasswordStates copyWith({
    String? errorMsg,
    ForgetPasswordStatus? status,
    bool? isFormValid,
    ForgetPasswordResponseEntity? response,
  }) {
    return ForgetPasswordStates(
      status: status ?? this.status,
      errorMsg: errorMsg ?? this.errorMsg,
      isFormValid: isFormValid ?? this.isFormValid,
      response: response ?? this.response,
    );
  }

  @override
  List<Object?> get props => [errorMsg, status, isFormValid, response];
}