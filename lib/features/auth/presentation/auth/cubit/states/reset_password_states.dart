// import 'package:online_exam_app/core/errors/failures.dart';
// import 'package:online_exam_app/features/auth/domain/entities/response_entities/reset_password_response_entity.dart';
//
// sealed class ResetPasswordStates {}
//
// class ResetPasswordInitialState extends ResetPasswordStates {}
//
// class ResetPasswordLoadingState extends ResetPasswordStates {}
//
// class ResetPasswordSuccessState extends ResetPasswordStates {
//   ResetPasswordResponseEntity resetPasswordResponseEntity;
//   ResetPasswordSuccessState({required this.resetPasswordResponseEntity});
// }
//
// class ResetPasswordErrorState extends ResetPasswordStates {
//   Failures failures;
//   ResetPasswordErrorState({required this.failures});
// }
import 'package:equatable/equatable.dart';
import 'package:online_exam_app/features/auth/domain/entities/response_entities/reset_password_response_entity.dart';
enum ResetPasswordStatus { initial, loading, success, error }
class ResetPasswordStates extends Equatable {

  final String? errorMsg;
  final bool isFormValid;
  final ResetPasswordStatus status;
  final ResetPasswordResponseEntity? response;

  const ResetPasswordStates({
    this.errorMsg,
    this.status = ResetPasswordStatus.initial,
    this.isFormValid = false,
    this.response,
  });

  ResetPasswordStates copyWith({
    String? errorMsg,
    ResetPasswordStatus? status,
    bool? isFormValid,
    ResetPasswordResponseEntity? response,
  }) {
    return ResetPasswordStates(
      status: status ?? this.status,
      errorMsg: errorMsg ?? this.errorMsg,
      isFormValid: isFormValid ?? this.isFormValid,
      response: response ?? this.response,
    );
  }

  @override
  List<Object?> get props => [errorMsg, status, isFormValid, response];
}