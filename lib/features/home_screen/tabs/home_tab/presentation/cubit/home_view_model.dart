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

  int examDuration = 0;
  HomeViewModel(this.getExamQuestionsUseCase) : super(HomeState());

  void doIntent(HomeEvent event) async {
    switch (event) {
      case GetExamQuestionsEvent(:final examId):
        _getExamQuestions(examId);
    }
  }

  Future<void> _getExamQuestions(String examId) async {
    emit(state.copyWith(examQuestionsIsLoadingArg: true));

    ApiResult<GetExamQuestionsResponseEntity> result =
        await getExamQuestionsUseCase.invoke(
      getExamQuestionsRequestEntity:
          GetExamQuestionsRequestEntity(subjectId: examId),
    );

    switch (result) {
      case ApiSuccessResult<GetExamQuestionsResponseEntity> success:
        final questions = success.data.questions;
        if (questions!.isNotEmpty && questions.first.exam?.duration != null) {
          examDuration = questions.first.exam!.duration!.toInt();
        }

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
  }
}
