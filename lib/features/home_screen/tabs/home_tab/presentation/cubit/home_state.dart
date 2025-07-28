import 'package:online_exam_app/features/home_screen/tabs/home_tab/domain/entities/response/get_exam_questions_response_entity.dart';

class HomeState {
  bool examQuestionsIsLoading;
  List<QuestionsEntity>? questionsList;
  String? examQuestionsError;
  /*###############################*/

  HomeState({
    this.examQuestionsIsLoading = true,
    this.questionsList = const [],
    this.examQuestionsError,
  });

  HomeState copyWith({
    bool? examQuestionsIsLoadingArg,
    List<QuestionsEntity>? questionsListArg,
    String? examQuestionsErrorArg,
  }) {
    return HomeState(
      examQuestionsIsLoading:
          examQuestionsIsLoadingArg ?? this.examQuestionsIsLoading,
      questionsList: questionsListArg ?? this.questionsList,
      examQuestionsError: examQuestionsErrorArg,
    );
  }
}




// //sealed=> make you must should handle every state
// import 'package:elevate_c3_sunday/features/home/domain/models/category_model.dart';

// sealed class HomeState {}

// class HomeInitialState extends HomeState {}

// class HomeLoadingState extends HomeState {}

// class HomeSuccessState extends HomeState {
//   List<CategoryModel> catList;
//   HomeSuccessState({required this.catList});
// }

// class HomeErrorState extends HomeState {
//   String errorMessage;
//   HomeErrorState({required this.errorMessage});
// }
 


