import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/request_entities/verify_reset_code_request_entity.dart';

part 'verify_reset_code_request_dto.g.dart';

@JsonSerializable()
class VerifyResetCodeRequestDto {
  @JsonKey(name: 'resetCode')
  final String resetCode;

  VerifyResetCodeRequestDto({
    required this.resetCode,
  });

  /// From Domain Entity
  factory VerifyResetCodeRequestDto.fromDomain(
      VerifyResetCodeRequestEntity entity,
      ) {
    return VerifyResetCodeRequestDto(
      resetCode: entity.resetCode,
    );
  }

  factory VerifyResetCodeRequestDto.fromJson(Map<String, dynamic> json) =>
      _$VerifyResetCodeRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyResetCodeRequestDtoToJson(this);
}
