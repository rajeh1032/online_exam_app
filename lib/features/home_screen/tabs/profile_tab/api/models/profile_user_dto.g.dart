// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileUserDto _$ProfileUserDtoFromJson(Map<String, dynamic> json) =>
    ProfileUserDto(
      Id: json['_id'] as String?,
      profileUserDtoName: json['username'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      role: json['role'] as String?,
      isVerified: json['isVerified'] as bool?,
      createdAt: json['createdAt'] as String?,
      passwordResetCode: json['passwordResetCode'] as String?,
      passwordResetExpires: json['passwordResetExpires'] as String?,
      resetCodeVerified: json['resetCodeVerified'] as bool?,
    );

Map<String, dynamic> _$ProfileUserDtoToJson(ProfileUserDto instance) =>
    <String, dynamic>{
      '_id': instance.Id,
      'username': instance.profileUserDtoName,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
      'role': instance.role,
      'isVerified': instance.isVerified,
      'createdAt': instance.createdAt,
      'passwordResetCode': instance.passwordResetCode,
      'passwordResetExpires': instance.passwordResetExpires,
      'resetCodeVerified': instance.resetCodeVerified,
    };
