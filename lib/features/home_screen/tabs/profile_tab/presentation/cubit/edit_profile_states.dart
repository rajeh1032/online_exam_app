import 'package:equatable/equatable.dart';




import '../../domain/entities/profile_user_entity.dart';




enum EditProfileStatus { initial, loading, success, error }




class EditProfileState extends Equatable {
  final ProfileUserEntity? response;
  final String? errorMsg;
  final EditProfileStatus status;
  final bool isFormValid;
  final bool hasFormChanged;




  const EditProfileState({
    this.response,
    this.errorMsg,
    this.status = EditProfileStatus.initial,
    this.isFormValid = false,
    this.hasFormChanged = false,
  });




  EditProfileState copyWith({
    ProfileUserEntity? response,
    String? errorMsg,
    EditProfileStatus? status,
    bool? isFormValid,
    bool? hasFormChanged,
  }) {
    return EditProfileState(
      response: response ?? this.response,
      errorMsg: errorMsg ?? this.errorMsg,
      status: status ?? this.status,
      isFormValid: isFormValid ?? this.isFormValid,
      hasFormChanged: hasFormChanged ?? this.hasFormChanged,
    );
  }




  @override
  List<Object?> get props => [
    response,
    errorMsg,
    status,
    isFormValid,
    hasFormChanged,
  ];
}
