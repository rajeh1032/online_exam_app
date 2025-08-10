import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/api/models/metadata_dto.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/api/models/subject_dto.dart';

part 'get_all_subject_response_dto.g.dart';

@JsonSerializable()
class GetAllSubjectResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "metadata")
  final MetadataDto? metadata;
  @JsonKey(name: "subjects")
  final List<SubjectsDto>? subjects;

  GetAllSubjectResponseDto ({
    this.message,
    this.metadata,
    this.subjects,
  });

  factory GetAllSubjectResponseDto.fromJson(Map<String, dynamic> json) {
    return _$GetAllSubjectResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetAllSubjectResponseDtoToJson(this);
  }
}






