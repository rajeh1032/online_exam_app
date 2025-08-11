import 'package:online_exam_app/features/auth/api/models/user_dto.dart';
import 'package:online_exam_app/features/auth/domain/entities/response_entities/sign_in_response_entity.dart';

extension UserDtoMapper on UserDto {
  UserEntity toEntity() {
    return UserEntity(
      id: id,
      username: username,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
      role: role,
      isVerified: isVerified,
      createdAt: createdAt,
      passwordResetCode: passwordResetCode ?? '',
      passwordResetExpires: passwordResetExpires ?? '',
      resetCodeVerified: resetCodeVerified ?? false,
    );
  }
}
