import 'package:online_exam_app/features/auth/api/models/response/verify_reset_code_response_dto.dart';
import 'package:online_exam_app/features/auth/domain/entities/verify_reset_code_response_entity.dart';

extension VerifyResetCodeDtoMapper on VerifyResetCodeResponseDto {
  VerifyResetCodeResponseEntity toEntity() {
    return VerifyResetCodeResponseEntity(status: status);
  }
}
