import 'package:hive/hive.dart';

part 'exam_result.g.dart';

@HiveType(typeId: 0)
class ExamResult {
  @HiveField(0)
  final String examId;

  @HiveField(1)
  final List<QuestionResult> questions;

  @HiveField(2)
  final int score;

  @HiveField(3)
  final DateTime completedAt;

  @HiveField(4)
  final String examTitle;

  ExamResult({
    required this.examId,
    required this.questions,
    required this.score,
    required this.completedAt,
    required this.examTitle,
  });

  // Helper methods
  int get totalQuestions => questions.length;
  
  double get percentage => totalQuestions > 0 ? (score / totalQuestions) * 100 : 0;
  
  int get correctAnswers => questions.where((q) => q.isCorrect).length;
  
  int get incorrectAnswers => totalQuestions - correctAnswers;
}

@HiveType(typeId: 1)
class QuestionResult {
  @HiveField(0)
  final String questionId;

  @HiveField(1)
  final String questionText;

  @HiveField(2)
  final List<AnswerOption> answerOptions;

  @HiveField(3)
  final String correctAnswerKey;

  @HiveField(4)
  final String userAnswerKey;

  QuestionResult({
    required this.questionId,
    required this.questionText,
    required this.answerOptions,
    required this.correctAnswerKey,
    required this.userAnswerKey,
  });

  // Helper getter to check if the answer is correct
  bool get isCorrect => userAnswerKey == correctAnswerKey && userAnswerKey.isNotEmpty;
  
  // Get the user's selected answer option
  AnswerOption? get userAnswerOption {
    try {
      return answerOptions.firstWhere((option) => option.key == userAnswerKey);
    } catch (e) {
      return null;
    }
  }
  
  // Get the correct answer option
  AnswerOption? get correctAnswerOption {
    try {
      return answerOptions.firstWhere((option) => option.key == correctAnswerKey);
    } catch (e) {
      return null;
    }
  }
}

@HiveType(typeId: 2)
class AnswerOption {
  @HiveField(0)
  final String key;
  
  @HiveField(1)
  final String answerText;

  AnswerOption({
    required this.key,
    required this.answerText,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnswerOption &&
          runtimeType == other.runtimeType &&
          key == other.key;

  @override
  int get hashCode => key.hashCode;
}