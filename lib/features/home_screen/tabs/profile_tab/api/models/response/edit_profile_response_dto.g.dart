// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditProfileResponseDto _$EditProfileResponseDtoFromJson(
        Map<String, dynamic> json) =>
    EditProfileResponseDto(
      message: json['message'] as String?,
      user: json['user'] == null
          ? null
          : ProfileUserDto.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EditProfileResponseDtoToJson(
        EditProfileResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'user': instance.user,
    };
