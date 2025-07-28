import 'package:online_exam_app/features/auth/api/models/response/reset_password_response_dto.dart';
import 'package:online_exam_app/features/auth/domain/entities/reset_password_response_entity.dart';

extension ResetPasswordDtoMapper on ResetPasswordResponseDto {
  ResetPasswordResponseEntity toEntity() {
    return ResetPasswordResponseEntity(message: message, token: token);
  }
}
