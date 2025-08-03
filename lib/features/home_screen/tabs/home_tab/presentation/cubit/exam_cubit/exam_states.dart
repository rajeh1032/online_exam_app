import 'package:equatable/equatable.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/domain/entities/response/get_exam_questions_response_entity.dart';

class ExamStates extends Equatable {
  bool examQuestionsIsLoading;
  List<QuestionsEntity>? questionsList;
  String? examQuestionsError;
  String? errorMessage;

  /*###############################*/

  ExamStates({
    this.examQuestionsIsLoading = true,
    this.questionsList = const [],
    this.examQuestionsError,
  });

  ExamStates copyWith({
    bool? examQuestionsIsLoadingArg,
    List<QuestionsEntity>? questionsListArg,
    String? examQuestionsErrorArg,
  }) {
    return ExamStates(
      examQuestionsIsLoading:
      examQuestionsIsLoadingArg ?? examQuestionsIsLoading,
      questionsList: questionsListArg ?? questionsList,
      examQuestionsError: examQuestionsErrorArg,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    examQuestionsIsLoading,
    questionsList,
    examQuestionsError,
  ];
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



