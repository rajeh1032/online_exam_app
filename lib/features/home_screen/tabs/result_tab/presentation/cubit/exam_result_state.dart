import 'package:online_exam_app/core/models/exam_result.dart';

class ExamResultState {}

class ExamResultInitial extends ExamResultState {}

class ExamResultLoading extends ExamResultState {}

class ExamResultSaved extends ExamResultState {}

class ExamResultDeleted extends ExamResultState {}

class AllResultsCleared extends ExamResultState {}

class SingleExamResultLoaded extends ExamResultState {
  final ExamResult? examResult;

  SingleExamResultLoaded({required this.examResult});
}

class AllExamResultsLoaded extends ExamResultState {
  final List<ExamResult> examResults;

  AllExamResultsLoaded({required this.examResults});
}

class ExamResultsByTitleLoaded extends ExamResultState {
  final List<ExamResult> examResults;

  ExamResultsByTitleLoaded({required this.examResults});
}

class RecentExamResultsLoaded extends ExamResultState {
  final List<ExamResult> examResults;

  RecentExamResultsLoaded({required this.examResults});
}

class ExamResultExists extends ExamResultState {
  final bool exists;

  ExamResultExists({required this.exists});
}

class ExamResultError extends ExamResultState {
  final String errorMessage;

  ExamResultError({required this.errorMessage});
}
