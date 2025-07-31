import 'package:online_exam_app/features/home_screen/tabs/home_tab/domain/entities/response/get_exam_questions_response_entity.dart';

class HomeState {
  bool examQuestionsIsLoading;
  List<QuestionsEntity>? questionsList;
  String? examQuestionsError;
  final int currentQuestionIndex;
  final Map<String, List<String>> userAnswers;
  final int? examScore;
  final bool isExamSubmitted;

  HomeState({
    this.examQuestionsIsLoading = true,
    this.questionsList = const [],
    this.examQuestionsError,
    this.currentQuestionIndex = 0,
    this.userAnswers = const {},
    this.examScore,
    this.isExamSubmitted = false,
  });

  HomeState copyWith({
    bool? examQuestionsIsLoadingArg,
    List<QuestionsEntity>? questionsListArg,
    String? examQuestionsErrorArg,
    int? currentQuestionIndexArg,
    Map<String, List<String>>? userAnswersArg,
    int? examScoreArg,
    bool? isExamSubmittedArg,
  }) {
    return HomeState(
      examQuestionsIsLoading:
          examQuestionsIsLoadingArg ?? this.examQuestionsIsLoading,
      questionsList: questionsListArg ?? this.questionsList,
      examQuestionsError: examQuestionsErrorArg,
      currentQuestionIndex:
          currentQuestionIndexArg ?? this.currentQuestionIndex,
      userAnswers: userAnswersArg ?? this.userAnswers,
      examScore: examScoreArg ?? this.examScore,
      isExamSubmitted: isExamSubmittedArg ?? this.isExamSubmitted,
    );
  }
}
