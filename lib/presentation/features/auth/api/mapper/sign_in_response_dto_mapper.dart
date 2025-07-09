import 'package:online_exam_app/presentation/features/auth/api/mapper/user_dto_mapper.dart';
import 'package:online_exam_app/presentation/features/auth/api/models/response/sign_in_response_dto.dart';
import 'package:online_exam_app/presentation/features/auth/api/models/user_dto.dart';
import 'package:online_exam_app/presentation/features/auth/domain/entities/sign_in_response_entity.dart';

extension SignInResponseDtoMapper on SignInResponseDto {
  SignInResponseEntity toEntity() {
    return SignInResponseEntity(
        message: message, token: token, user: user.toEntity());
  }
}
