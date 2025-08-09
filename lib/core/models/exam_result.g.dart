// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_result.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExamResultAdapter extends TypeAdapter<ExamResult> {
  @override
  final int typeId = 0;

  @override
  ExamResult read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExamResult(
      examId: fields[0] as String,
      questions: (fields[1] as List).cast<QuestionResult>(),
      score: fields[2] as int,
      completedAt: fields[3] as DateTime,
      examTitle: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ExamResult obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.examId)
      ..writeByte(1)
      ..write(obj.questions)
      ..writeByte(2)
      ..write(obj.score)
      ..writeByte(3)
      ..write(obj.completedAt)
      ..writeByte(4)
      ..write(obj.examTitle);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExamResultAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class QuestionResultAdapter extends TypeAdapter<QuestionResult> {
  @override
  final int typeId = 1;

  @override
  QuestionResult read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuestionResult(
      questionId: fields[0] as String,
      questionText: fields[1] as String,
      answerOptions: (fields[2] as List).cast<AnswerOption>(),
      correctAnswerKey: fields[3] as String,
      userAnswerKey: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, QuestionResult obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.questionId)
      ..writeByte(1)
      ..write(obj.questionText)
      ..writeByte(2)
      ..write(obj.answerOptions)
      ..writeByte(3)
      ..write(obj.correctAnswerKey)
      ..writeByte(4)
      ..write(obj.userAnswerKey);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuestionResultAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AnswerOptionAdapter extends TypeAdapter<AnswerOption> {
  @override
  final int typeId = 2;

  @override
  AnswerOption read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AnswerOption(
      key: fields[0] as String,
      answerText: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AnswerOption obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.key)
      ..writeByte(1)
      ..write(obj.answerText);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnswerOptionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
