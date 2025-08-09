import 'package:json_annotation/json_annotation.dart';

import '../exam_dto.dart';
import '../metadata_dto.dart';

part 'get_all_exam_on_subject_response_dto.g.dart';

@JsonSerializable()
class GetAllExamOnSubjectDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "metadata")
  final MetadataDto? metadata;
  @JsonKey(name: "exams")
  final List<ExamsDto>? exams;

  GetAllExamOnSubjectDto ({
    this.message,
    this.metadata,
    this.exams,
  });

  factory GetAllExamOnSubjectDto.fromJson(Map<String, dynamic> json) {
    return _$GetAllExamOnSubjectDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetAllExamOnSubjectDtoToJson(this);
  }
}






