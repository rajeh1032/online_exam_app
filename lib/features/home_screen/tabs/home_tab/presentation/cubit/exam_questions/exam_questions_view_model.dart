import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/api_result/api_result.dart';
import 'package:online_exam_app/core/models/exam_result.dart';
import 'package:online_exam_app/core/utils/exam_result_storage.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/domain/entities/get_exam_questions_request_Entity.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/domain/entities/response/get_exam_questions_response_entity.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/domain/usecases/get_exam_questions_use_case.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/presentation/cubit/exam_questions/exam_questions_event.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/presentation/cubit/exam_questions/exam_questions_state.dart';

@injectable
class ExamQuestionsViewModel extends Cubit<ExamQuestionsState> {
  final GetExamQuestionsUseCase getExamQuestionsUseCase;

  ExamQuestionsViewModel(this.getExamQuestionsUseCase)
      : super(ExamQuestionsState());

  void doIntent(ExamQuetionsEvent event) async {
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

  double calculatePercentage(int score, int totalQuestions) {
    if (totalQuestions == 0) return 0;
    return score / totalQuestions * 100;
  }

  void _selectAnswer(int answerIndex) {
    final questions = state.questionsList;
    if (questions == null || questions.isEmpty) return;

    final currentQuestion = questions[state.currentQuestionIndex];
    final selectedAnswerKey = currentQuestion.answers?[answerIndex].key;

    if (selectedAnswerKey == null) return;

    final questionId = currentQuestion.id ?? '';
    final singleChoice = isSingleChoice(currentQuestion);
    final updatedAnswers = Map<String, List<String>>.from(state.userAnswers);
    if (singleChoice) {
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

  void _submitExam() async {
    final questions = state.questionsList;
    if (questions == null || questions.isEmpty) return;
    final score = _calculateScore(questions, state.userAnswers);

    //todo: save to hive

    final examResult = _createExamResult(
      examId:
          '6700708d30a3c3c1944a9c60', // widget.examId, // Pass this from your screen
      questions: questions,
      userAnswers: state.userAnswers,
      score: score,
    );
    try {
      await ExamResultStorage.saveExamResult(examResult);
    } catch (e) {
      print('Error saving exam result: $e');
    }

    emit(state.copyWith(
      examScoreArg: score,
      isExamSubmittedArg: true,
    ));
  }

  ExamResult _createExamResult({
    required String examId,
    required List<QuestionsEntity> questions,
    required Map<String, List<String>> userAnswers,
    required int score,
  }) {
    final questionResults = questions.map((question) {
      final questionId = question.id ?? '';
      final userAnswersList = userAnswers[questionId] ?? [];
      final userAnswerKey =
          userAnswersList.isNotEmpty ? userAnswersList.first : '';
      final answerOptions = question.answers?.map((answer) {
            return AnswerOption(
              key: answer.key ?? '',
              answerText: answer.answer ?? '',
            );
          }).toList() ??
          [];
      return QuestionResult(
        questionId: questionId,
        questionText: question.question ?? '',
        answerOptions: answerOptions,
        correctAnswerKey: question.correct ?? '',
        userAnswerKey: userAnswerKey,
      );
    }).toList();

    return ExamResult(
      examId: examId,
      questions: questionResults,
      score: score,
      completedAt: DateTime.now(),
      examTitle: 'Exam',
    );
  }
}
