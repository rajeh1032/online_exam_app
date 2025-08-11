import 'package:json_annotation/json_annotation.dart';

part 'get_exam_questions_response_dto.g.dart'; // The generated file will be exam_models.g.dart

// --- ExamResponseDto ---
@JsonSerializable()
class ExamResponseDto {
  ExamResponseDto({
    this.message,
    this.questions,
  });

  final String? message;
  final List<Questions>? questions;

  factory ExamResponseDto.fromJson(Map<String, dynamic> json) => _$ExamResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ExamResponseDtoToJson(this);
}

// --- Questions ---
@JsonSerializable()
class Questions {
  Questions({
    this.id,
    this.question,
    this.answers,
    this.type,
    this.correct,
    this.subject,
    this.exam,
    this.createdAt,
  });

  @JsonKey(name: '_id') // Map JSON '_id' to Dart 'id'
  final String? id;
  final String? question;
  final List<Answers>? answers;
  final String? type;
  final String? correct;
  final Subject? subject;
  final Exam? exam;
  final String? createdAt;

  factory Questions.fromJson(Map<String, dynamic> json) => _$QuestionsFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionsToJson(this);
}

// --- Exam ---
@JsonSerializable()
class Exam {
  Exam({
    this.id,
    this.title,
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.active,
    this.createdAt,
  });

  @JsonKey(name: '_id') // Map JSON '_id' to Dart 'id'
  final String? id;
  final String? title;
  final num? duration; // Use num for flexibility (int or double)
  final String? subject; // Assuming subject is just an ID string here
  final num? numberOfQuestions;
  final bool? active;
  final String? createdAt;

  factory Exam.fromJson(Map<String, dynamic> json) => _$ExamFromJson(json);

  Map<String, dynamic> toJson() => _$ExamToJson(this);
}

// --- Subject ---
@JsonSerializable()
class Subject {
  Subject({
    this.id,
    this.name,
    this.icon,
    this.createdAt,
  });

  @JsonKey(name: '_id') // Map JSON '_id' to Dart 'id'
  final String? id;
  final String? name;
  final String? icon;
  final String? createdAt;

  factory Subject.fromJson(Map<String, dynamic> json) => _$SubjectFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectToJson(this);
}

// --- Answers ---
@JsonSerializable()
class Answers {
  Answers({
    this.answer,
    this.key,
  });

  final String? answer;
  final String? key;

  factory Answers.fromJson(Map<String, dynamic> json) => _$AnswersFromJson(json);

  Map<String, dynamic> toJson() => _$AnswersToJson(this);
}