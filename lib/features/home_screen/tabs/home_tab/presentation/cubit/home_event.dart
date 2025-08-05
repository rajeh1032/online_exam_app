sealed class HomeEvent {}

class GetExamQuestionsEvent extends HomeEvent {
  final String examId;
  GetExamQuestionsEvent({required this.examId});
}

class SelectedAnswerEvent extends HomeEvent {
  final int answerIndex;
  SelectedAnswerEvent({required this.answerIndex});
}

class NavigateToPreviousQuestionEvent extends HomeEvent {}

class NavigateToNextQuestionEvent extends HomeEvent {}

class SubmitExamEvent extends HomeEvent {}
