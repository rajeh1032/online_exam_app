import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/request/edit_profile_request_entity.dart';

part 'edit_profile_request_dto.g.dart';

@JsonSerializable()
class EditProfileRequestDto {
  @JsonKey(name: 'email')
  final String? email;

  @JsonKey(name: 'firstName')
  final String? firstName;

  @JsonKey(name: 'lastName')
  final String? lastName;

  @JsonKey(name: 'username')
  final String? userName;

  @JsonKey(name: 'phone')
  final String? phone;

  const EditProfileRequestDto({
    this.email,
    this.firstName,
    this.lastName,
    this.userName,
    this.phone,
  });

  /// From Domain Entity
  factory EditProfileRequestDto.fromDomain(EditProfileRequestEntity entity) {
    return EditProfileRequestDto(
      email: entity.email,
      firstName: entity.firstName,
      lastName: entity.lastName,
      userName: entity.userName,
      phone: entity.phone,
    );
  }

  /// From JSON
  factory EditProfileRequestDto.fromJson(Map<String, dynamic> json) =>
      _$EditProfileRequestDtoFromJson(json);

  /// To JSON
  Map<String, dynamic> toJson() => _$EditProfileRequestDtoToJson(this);
}