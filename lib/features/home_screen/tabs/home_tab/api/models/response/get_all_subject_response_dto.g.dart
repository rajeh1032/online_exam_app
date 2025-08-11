// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_subject_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllSubjectResponseDto _$GetAllSubjectResponseDtoFromJson(
        Map<String, dynamic> json) =>
    GetAllSubjectResponseDto(
      message: json['message'] as String?,
      metadata: json['metadata'] == null
          ? null
          : MetadataDto.fromJson(json['metadata'] as Map<String, dynamic>),
      subjects: (json['subjects'] as List<dynamic>?)
          ?.map((e) => SubjectsDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllSubjectResponseDtoToJson(
        GetAllSubjectResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'metadata': instance.metadata,
      'subjects': instance.subjects,
    };
