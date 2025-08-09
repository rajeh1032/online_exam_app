import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/api_result/api_result.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/domain/entities/response/get_all_subject_response_entity.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/presentation/cubit/home_state.dart';

import '../../domain/usecases/get_all_subject_use_case.dart';

@injectable
class HomeViewModel extends Cubit<HomeState> {
  final GetAllSubjectUseCase _getAllSubjectUseCase;

  HomeViewModel({required GetAllSubjectUseCase getAllSubjectUseCase})
      : _getAllSubjectUseCase = getAllSubjectUseCase,
        super(const HomeState());

  Future<void> getAllSubjects() async {
    emit(state.copyWith(status: HomeStatus.loading));
    final ApiResult<GetAllSubjectsResponseEntity> result =
        await _getAllSubjectUseCase.invoke();
    switch (result) {
      case ApiSuccessResult<GetAllSubjectsResponseEntity>():
        emit(state.copyWith(
          response: result.data,
          status: HomeStatus.success,
          allSubjects: result.data.subjects,
          filteredSubjects: result.data.subjects,
        ));
        break;
      case ApiErrorResult<GetAllSubjectsResponseEntity>():
        emit(state.copyWith(
          errorMsg: result.errorMsg,
          status: HomeStatus.error,
        ));
        break;
    }
  }

  void filterSubjects(String query) {
    if (query.isEmpty) {
      emit(state.copyWith(filteredSubjects: state.allSubjects));
      return;
    }
    final filtered = state.allSubjects
        .where((subject) =>
            subject.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    emit(state.copyWith(filteredSubjects: filtered));
  }
}
