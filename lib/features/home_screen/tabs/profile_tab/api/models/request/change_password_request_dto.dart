import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/request/change_password_request_entity.dart';

part 'change_password_request_dto.g.dart';

@JsonSerializable()
class ChangePasswordRequestDto {
  @JsonKey(name: 'oldPassword')
  final String? oldPassword;

  @JsonKey(name: 'password')
  final String? password;

  @JsonKey(name: 'rePassword')
  final String? rePassword;

  const ChangePasswordRequestDto({
    this.oldPassword,
    this.password,
    this.rePassword,
  });

  /// From Domain Entity
  factory ChangePasswordRequestDto.fromDomain(ChangePasswordRequestEntity entity) {
    return ChangePasswordRequestDto(
      oldPassword: entity.oldPassword,
      password: entity.password,
      rePassword: entity.rePassword,
    );
  }

  /// From JSON
  factory ChangePasswordRequestDto.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordRequestDtoFromJson(json);

  /// To JSON
  Map<String, dynamic> toJson() => _$ChangePasswordRequestDtoToJson(this);
}