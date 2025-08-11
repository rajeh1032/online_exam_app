import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/request_entities/sign_in_request_entity.dart';

part 'sign_in_request_dto.g.dart';
@JsonSerializable()
class SignInRequestDto {
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'password')
  final String password;

  SignInRequestDto({
    required this.email,
    required this.password
});

/// From Domain Entity
  factory SignInRequestDto.fromDomain(SignInRequestEntity entity) {
    return SignInRequestDto(

      email: entity.email,
      password: entity.password,

    );
  }

  factory SignInRequestDto.fromJson(Map<String, dynamic> json) =>
      _$SignInRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SignInRequestDtoToJson(this);

}