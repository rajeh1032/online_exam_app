import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/presentation/features/auth/api/models/user_dto.dart';

part 'sign_in_response_dto.g.dart';

@JsonSerializable()
class SignInResponseDto {
  final String message;
  final String token;
  final UserDto user;

  SignInResponseDto({
    required this.message,
    required this.token,
    required this.user,
  });

  factory SignInResponseDto.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SignInResponseDtoToJson(this);
}
