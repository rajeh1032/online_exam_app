import '../../domain/entities/profile_user_entity.dart';
import '../models/profile_user_dto.dart';

extension ProfileUserDtoMapper on ProfileUserDto {
  ProfileUserEntity toEntity() {
    return ProfileUserEntity(
      id: Id ?? '',
      username: profileUserDtoName ?? '',
      firstName: firstName ?? '',
      lastName: lastName ?? '',
      email: email ?? '',
      phone: phone ?? '',
      role: role ?? '',
      isVerified: isVerified ?? false,
      createdAt: createdAt ?? '',
      passwordResetCode: passwordResetCode ?? '',
      passwordResetExpires: passwordResetExpires ?? '',
      resetCodeVerified: resetCodeVerified ?? false,
    );
  }
}