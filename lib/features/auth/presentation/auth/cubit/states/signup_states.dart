import 'package:equatable/equatable.dart';

import '../../../../domain/entities/response_entities/sign_up_response_entity.dart';

enum SignUpStatus { initial, loading, success, error }

class SignUpState extends Equatable {
  final SignUpResponseEntity? response;
  final String? errorMsg;
  final bool isFormValid;
  final SignUpStatus status;

  const SignUpState({
    this.response,
    this.errorMsg,
    this.status = SignUpStatus.initial,
    this.isFormValid = false,
  });

  SignUpState copyWith({
    SignUpResponseEntity? response,
    String? errorMsg,
    SignUpStatus? status,
    bool? isFormValid,
  }) {
    return SignUpState(
      status: status ?? this.status,
      response: response ?? this.response,
      errorMsg: errorMsg ?? this.errorMsg,
      isFormValid: isFormValid ?? this.isFormValid,
    );
  }

  @override
  List<Object?> get props => [response, errorMsg, status, isFormValid];
}
