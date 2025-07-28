// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_exam_questions_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetExamQuestionsRequestDto _$GetExamQuestionsRequestDtoFromJson(
        Map<String, dynamic> json) =>
    GetExamQuestionsRequestDto(
      subjectId: json['subject'] as String,
    );

Map<String, dynamic> _$GetExamQuestionsRequestDtoToJson(
        GetExamQuestionsRequestDto instance) =>
    <String, dynamic>{
      'subject': instance.subjectId,
    };
