import 'package:online_exam_app/features/auth/api/mapper/user_dto_mapper.dart';
import 'package:online_exam_app/features/auth/api/models/response/sign_in_response_dto.dart';
import 'package:online_exam_app/features/auth/domain/entities/response_entities/sign_in_response_entity.dart';

extension SignInResponseDtoMapper on SignInResponseDto {
  SignInResponseEntity toEntity() {
    return SignInResponseEntity(
        message: message, token: token, user: user.toEntity());
  }
}
