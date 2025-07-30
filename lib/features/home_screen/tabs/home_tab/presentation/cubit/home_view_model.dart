import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/api_result/api_result.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/domain/entities/get_exam_questions_request_Entity.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/domain/entities/response/get_exam_questions_response_entity.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/domain/usecases/get_exam_questions_use_case.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/presentation/cubit/home_event.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/presentation/cubit/home_state.dart';

@injectable
class HomeViewModel extends Cubit<HomeState> {
  final GetExamQuestionsUseCase getExamQuestionsUseCase;

  HomeViewModel(this.getExamQuestionsUseCase) : super(HomeState());

  void doIntent(HomeEvent event) async {
    switch (event) {
      case GetExamQuestionsEvent(:final examId):
        _getExamQuestions(examId);
      case SelectedAnswerEvent(answerIndex: final answerIndex):
        _selectAnswer(answerIndex);
      case NavigateToPreviousQuestionEvent():
        _navigateToPreviousQuestion();
      case NavigateToNextQuestionEvent():
        _navigateToNextQuestion();
      case SubmitExamEvent():
        _submitExam();
    }
  }

  Future<void> _getExamQuestions(String examId) async {
    emit(state.copyWith(examQuestionsIsLoadingArg: true));
    try {
      ApiResult<GetExamQuestionsResponseEntity> result =
          await getExamQuestionsUseCase.invoke(
        getExamQuestionsRequestEntity:
            GetExamQuestionsRequestEntity(subjectId: examId),
      );

      switch (result) {
        case ApiSuccessResult<GetExamQuestionsResponseEntity> success:
          emit(state.copyWith(
            examQuestionsIsLoadingArg: false,
            questionsListArg: success.data.questions,
          ));

        case ApiErrorResult<GetExamQuestionsResponseEntity> error:
          emit(state.copyWith(
            examQuestionsIsLoadingArg: false,
            examQuestionsErrorArg: error.errorMsg,
          ));
      }
    } catch (e) {
      emit(state.copyWith(
        examQuestionsIsLoadingArg: false,
        examQuestionsErrorArg: 'Something went wrong $e',
      ));
    }
  }

  void _selectAnswer(int answerIndex) {
    final questions = state.questionsList;
    if (questions == null || questions.isEmpty) return;

    final currentQuestion = questions[state.currentQuestionIndex];
    final selectedAnswerKey = currentQuestion.answers?[answerIndex].key;

    if (selectedAnswerKey == null) return;

    final questionId = currentQuestion.id ?? '';
    final _isSingleChoice = isSingleChoice(currentQuestion);
    final updatedAnswers = Map<String, List<String>>.from(state.userAnswers);
    if (_isSingleChoice) {
      updatedAnswers[questionId] = [selectedAnswerKey];
    } else {
      final currentAnswers = updatedAnswers[questionId] ?? [];
      if (currentAnswers.contains(selectedAnswerKey)) {
        currentAnswers.remove(selectedAnswerKey);
      } else {
        currentAnswers.add(selectedAnswerKey);
      }
      updatedAnswers[questionId] = currentAnswers;
    }
    emit(state.copyWith(userAnswersArg: updatedAnswers));
  }

  bool isSingleChoice(QuestionsEntity question) {
    return question.type?.toLowerCase() == "single_choice";
  }

  List<int> getSelectedAnswerIndices(QuestionsEntity question) {
    final questionId = question.id ?? '';
    final selectedKeys = state.userAnswers[questionId] ?? [];
    final indices = <int>[];

    if (question.answers != null) {
      for (int i = 0; i < question.answers!.length; i++) {
        if (selectedKeys.contains(question.answers![i].key)) {
          indices.add(i);
        }
      }
    }

    return indices;
  }

  void _navigateToPreviousQuestion() {
    if (state.currentQuestionIndex > 0) {
      emit(state.copyWith(
          currentQuestionIndexArg: state.currentQuestionIndex - 1));
    }
  }

  void _navigateToNextQuestion() {
    final totalQuestions = state.questionsList?.length ?? 0;

    if (state.currentQuestionIndex < totalQuestions - 1) {
      emit(state.copyWith(
          currentQuestionIndexArg: state.currentQuestionIndex + 1));
    }
  }

  void _submitExam() {
    final questions = state.questionsList;
    if (questions == null) return;
    final score = _calculateScore(questions, state.userAnswers);
    emit(state.copyWith(examScoreArg: score));
  }

  int _calculateScore(
      List<QuestionsEntity> questions, Map<String, List<String>> userAnswers) {
    int score = 0;

    for (final question in questions) {
      final questionId = question.id ?? '';
      final correctAnswer = question.correct;
      final userAnswersList = userAnswers[questionId] ?? [];

      if (userAnswersList.length == 1 &&
          userAnswersList.first == correctAnswer) {
        score++;
      }
    }

    return score;
  }
}
