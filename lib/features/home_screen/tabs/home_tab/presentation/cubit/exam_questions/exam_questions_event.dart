sealed class ExamQuetionsEvent {}

class GetExamQuestionsEvent extends ExamQuetionsEvent {
  final String examId;
  GetExamQuestionsEvent({required this.examId});
}

class SelectedAnswerEvent extends ExamQuetionsEvent {
  final int answerIndex;
  SelectedAnswerEvent({required this.answerIndex});
}

class NavigateToPreviousQuestionEvent extends ExamQuetionsEvent {}

class NavigateToNextQuestionEvent extends ExamQuetionsEvent {}

class SubmitExamEvent extends ExamQuetionsEvent {}
