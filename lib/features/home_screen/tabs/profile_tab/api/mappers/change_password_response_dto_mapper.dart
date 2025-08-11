
import '../../domain/entities/response/change_password_response_entity.dart';
import '../models/response/change_password_response_dto.dart';

extension ChangePasswordResponseDtoMapper on ChangePasswordResponseDto {
  ChangePasswordResponseEntity toEntity() {
    return ChangePasswordResponseEntity(
      token: token ?? '',
      message: message ?? '',
    );
  }
}