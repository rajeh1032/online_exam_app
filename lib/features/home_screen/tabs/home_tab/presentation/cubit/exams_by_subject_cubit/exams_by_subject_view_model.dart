import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/api_result/api_result.dart';

import '../../../domain/entities/request/get_all_exam_on_subject_request_entity.dart';
import '../../../domain/entities/response/get_all_exam_on_subject_entity.dart';
import '../../../domain/usecases/get_all_exam_on_subject_use_case.dart';
import 'exams_by_subject_state.dart';


@injectable
class ExamsBySubjectViewModel extends Cubit<ExamsBySubjectState> {
  final GetAllExamOnSubjectUseCase _getAllExamOnSubjectUseCase;

  ExamsBySubjectViewModel({
    required GetAllExamOnSubjectUseCase getAllExamOnSubjectUseCase,
  })  : _getAllExamOnSubjectUseCase = getAllExamOnSubjectUseCase,
        super(const ExamsBySubjectState());

  Future<void> getExamsBySubject(String subjectId) async {
    emit(state.copyWith(status: ExamsBySubjectStatus.loading));

    final request = GetAllExamOnSubjectRequestEntity(subjectId: subjectId);
    final ApiResult<GetAllExamOnSubjectEntity> result =
    await _getAllExamOnSubjectUseCase.invoke(request);

    switch (result) {
      case ApiSuccessResult<GetAllExamOnSubjectEntity>():
        emit(state.copyWith(
          exams: result.data.exams ?? [],
          status: ExamsBySubjectStatus.success,
        ));
        break;

      case ApiErrorResult<GetAllExamOnSubjectEntity>():
        emit(state.copyWith(
          errorMsg: result.errorMsg,
          status: ExamsBySubjectStatus.error,
        ));
        break;
    }
  }
}
