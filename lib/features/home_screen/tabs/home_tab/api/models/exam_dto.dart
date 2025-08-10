

import 'package:json_annotation/json_annotation.dart';
part 'exam_dto.g.dart';
@JsonSerializable()
class ExamsDto {
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "duration")
  final int? duration;
  @JsonKey(name: "subject")
  final String? subject;
  @JsonKey(name: "numberOfQuestions")
  final int? numberOfQuestions;
  @JsonKey(name: "active")
  final bool? active;
  @JsonKey(name: "createdAt")
  final String? createdAt;

  ExamsDto ({
    this.Id,
    this.title,
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.active,
    this.createdAt,
  });

  factory ExamsDto.fromJson(Map<String, dynamic> json) {
    return _$ExamsDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ExamsDtoToJson(this);
  }
}