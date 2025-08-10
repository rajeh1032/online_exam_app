import 'package:equatable/equatable.dart';

import '../../domain/entities/response/change_password_response_entity.dart';

enum ChangePasswordStatus { initial, loading, success, error }

class ChangePasswordState extends Equatable {
  final ChangePasswordResponseEntity? response;
  final String? errorMsg;
  final ChangePasswordStatus status;
  final bool isFormValid;

  const ChangePasswordState({
    this.response,
    this.errorMsg,
    this.status = ChangePasswordStatus.initial,
    this.isFormValid = false,
  });

  ChangePasswordState copyWith({
    ChangePasswordResponseEntity? response,
    String? errorMsg,
    ChangePasswordStatus? status,
    bool? isFormValid,
  }) {
    return ChangePasswordState(
      response: response ?? this.response,
      errorMsg: errorMsg ?? this.errorMsg,
      status: status ?? this.status,
      isFormValid: isFormValid ?? this.isFormValid,
    );
  }

  @override
  List<Object?> get props => [
    response,
    errorMsg,
    status,
    isFormValid,
  ];
}
