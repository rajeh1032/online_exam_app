sealed class HomeEvent {}

class GetExamQuestionsEvent extends HomeEvent {
  final String examId;
  GetExamQuestionsEvent({required this.examId});
}
