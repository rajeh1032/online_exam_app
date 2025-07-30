class ExamStatisticsUtils {
  final int totalQuestions;
  final int answerQuestions;
  final int correctQuestions;
  final int percentage;

  ExamStatisticsUtils({
    required this.totalQuestions,
    required this.answerQuestions,
    required this.correctQuestions,
    required this.percentage,
  });
  @override
  String toString() {
    return 'ExamStatisticsUtils(totalQuestions: $totalQuestions, answerQuestions: $answerQuestions, correctQuestions: $correctQuestions, percentage: $percentage)';
  }
}
