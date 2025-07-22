import 'package:online_exam_app/features/auth/api/models/response/forget_password_response_dto.dart';
import 'package:online_exam_app/features/auth/domain/entities/forget_password_response_entity.dart';

extension ForgetPasswordDtoMapper on ForgetPasswordResponseDto {
  ForgetPasswordResponseEntity toEntity() {
    return ForgetPasswordResponseEntity(
      message: message,
      info: info,
    );
  }
}
