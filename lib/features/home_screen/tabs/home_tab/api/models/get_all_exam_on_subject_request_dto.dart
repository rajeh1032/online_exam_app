import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/get_all_exam_on_subject_request_entity.dart';

part 'get_all_exam_on_subject_request_dto.g.dart';

@JsonSerializable()
class GetAllExamOnSubjectRequestDto {
  @JsonKey(name: 'subject')
  final String subjectId;

  GetAllExamOnSubjectRequestDto({
    required this.subjectId,
  });

  /// From Domain Entity
  factory GetAllExamOnSubjectRequestDto.fromDomain(GetAllExamOnSubjectRequestEntity entity) {
    return GetAllExamOnSubjectRequestDto(
      subjectId: entity.subjectId,
    );
  }

  factory GetAllExamOnSubjectRequestDto.fromJson(Map<String, dynamic> json) =>
      _$GetAllExamOnSubjectRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllExamOnSubjectRequestDtoToJson(this);
}
