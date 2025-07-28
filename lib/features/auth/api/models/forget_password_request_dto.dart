import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/auth/domain/entities/request_entities/forget_password_request_entity.dart';


part 'forget_password_request_dto.g.dart';
@JsonSerializable()
class ForgetPasswordRequestDto {
  @JsonKey(name: 'email')
  final String email;

  ForgetPasswordRequestDto({
    required this.email,
  });


/// From Domain Entity
  factory ForgetPasswordRequestDto.fromDomain(ForgetPasswordRequestEntity entity) {
    return ForgetPasswordRequestDto(
      email: entity.email,
    );
  }

  factory ForgetPasswordRequestDto.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ForgetPasswordRequestDtoToJson(this);

}