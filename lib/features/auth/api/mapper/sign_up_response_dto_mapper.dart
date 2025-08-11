import 'package:online_exam_app/features/auth/api/mapper/user_dto_mapper.dart';

import '../../domain/entities/response_entities/sign_up_response_entity.dart';
import '../models/response/sign_up_response_dto.dart';

extension SignUpResponseDtoMapper on SignUpResponseDto {
  SignUpResponseEntity toEntity() {
    return SignUpResponseEntity(
        message: message!, token: token!, user: user!.toEntity());
  }
}
