// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_exam_on_subject_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllExamOnSubjectDto _$GetAllExamOnSubjectDtoFromJson(
        Map<String, dynamic> json) =>
    GetAllExamOnSubjectDto(
      message: json['message'] as String?,
      metadata: json['metadata'] == null
          ? null
          : MetadataDto.fromJson(json['metadata'] as Map<String, dynamic>),
      exams: (json['exams'] as List<dynamic>?)
          ?.map((e) => ExamsDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllExamOnSubjectDtoToJson(
        GetAllExamOnSubjectDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'metadata': instance.metadata,
      'exams': instance.exams,
    };
