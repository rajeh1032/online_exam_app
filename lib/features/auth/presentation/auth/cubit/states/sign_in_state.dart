import 'package:equatable/equatable.dart';

import '../../../../domain/entities/response_entities/sign_in_response_entity.dart';

enum SignInStatus { initial, loading, success, error,autoAuthenticated }

class SignInState extends Equatable {
  final SignInResponseEntity? response;
  final String? errorMsg;
  final bool rememberMe;
  final SignInStatus status;
  final bool isFormValid;
  final String? userName;

  const SignInState({
    this.response,
    this.errorMsg,
    this.rememberMe = false,
    this.status = SignInStatus.initial,
    this.isFormValid = false,
    this.userName,
  });

  SignInState copyWith({
    SignInResponseEntity? response,
    String? errorMsg,
    bool? rememberMe,
    SignInStatus? status,
    bool? isFormValid,
    String? userName,
  }) {
    return SignInState(
        status: status ?? this.status,
        response: response ?? this.response,
        errorMsg: errorMsg ?? this.errorMsg,
        rememberMe: rememberMe ?? this.rememberMe,
      isFormValid: isFormValid ?? this.isFormValid,
      userName: userName ?? this.userName,
    );
  }

  @override
  List<Object?> get props => [response, errorMsg, rememberMe, status,isFormValid, userName];
}
