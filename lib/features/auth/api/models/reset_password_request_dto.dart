import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/request_entities/reset_password_request_entity.dart';

part 'reset_password_request_dto.g.dart';

@JsonSerializable()
class ResetPasswordRequestDto {
  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'newPassword')
  final String newPassword;

  ResetPasswordRequestDto({
    required this.email,
    required this.newPassword,
  });

  /// From Domain Entity
  factory ResetPasswordRequestDto.fromDomain(ResetPasswordRequestEntity entity) {
    return ResetPasswordRequestDto(
      email: entity.email,
      newPassword: entity.newPassword,
    );
  }

  /// From JSON
  factory ResetPasswordRequestDto.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordRequestDtoFromJson(json);

  /// To JSON
  Map<String, dynamic> toJson() => _$ResetPasswordRequestDtoToJson(this);
}
