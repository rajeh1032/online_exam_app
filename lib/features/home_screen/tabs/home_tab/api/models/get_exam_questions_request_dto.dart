import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/domain/entities/get_exam_questions_request_Entity.dart';

part 'get_exam_questions_request_dto.g.dart';

@JsonSerializable()
class GetExamQuestionsRequestDto {
  @JsonKey(name: 'subject')
  final String subjectId;

  GetExamQuestionsRequestDto({
    required this.subjectId,
  });

  /// From Domain Entity
  factory GetExamQuestionsRequestDto.fromDomain(GetExamQuestionsRequestEntity entity) {
    return GetExamQuestionsRequestDto(
      subjectId: entity.subjectId,
    );
  }

  GetExamQuestionsRequestEntity toDomain() {
    return GetExamQuestionsRequestEntity(
      subjectId: subjectId,
    );
  }

  factory GetExamQuestionsRequestDto.fromJson(Map<String, dynamic> json) =>
      _$GetExamQuestionsRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GetExamQuestionsRequestDtoToJson(this);
}
