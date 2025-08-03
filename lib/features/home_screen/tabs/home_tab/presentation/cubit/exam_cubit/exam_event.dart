sealed class ExamEvent {}

class GetExamQuestionsEvent extends ExamEvent {
  final String examId;
  GetExamQuestionsEvent({required this.examId});
}
