// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_data_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserDataResponseDto _$GetUserDataResponseDtoFromJson(
        Map<String, dynamic> json) =>
    GetUserDataResponseDto(
      message: json['message'] as String?,
      user: json['user'] == null
          ? null
          : ProfileUserDto.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetUserDataResponseDtoToJson(
        GetUserDataResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'user': instance.user,
    };
