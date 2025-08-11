// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditProfileRequestDto _$EditProfileRequestDtoFromJson(
        Map<String, dynamic> json) =>
    EditProfileRequestDto(
      email: json['email'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      userName: json['username'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$EditProfileRequestDtoToJson(
        EditProfileRequestDto instance) =>
    <String, dynamic>{
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'username': instance.userName,
      'phone': instance.phone,
    };
