import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/api_result/api_result.dart';
import 'package:online_exam_app/core/models/exam_result.dart';
import 'package:online_exam_app/features/home_screen/tabs/result_tab/domain/usecases/clear_all_results_use_case.dart';
import 'package:online_exam_app/features/home_screen/tabs/result_tab/domain/usecases/delete_exam_result_use_case.dart';
import 'package:online_exam_app/features/home_screen/tabs/result_tab/domain/usecases/get_all_exam_results_use_case.dart';
import 'package:online_exam_app/features/home_screen/tabs/result_tab/domain/usecases/get_exam_results_by_title_use_case.dart';
import 'package:online_exam_app/features/home_screen/tabs/result_tab/domain/usecases/get_recent_results_use_case.dart';
import 'package:online_exam_app/features/home_screen/tabs/result_tab/domain/usecases/has_exam_result_use_case.dart';
import 'package:online_exam_app/features/home_screen/tabs/result_tab/domain/usecases/save_exam_result_use_case.dart';
import 'package:online_exam_app/features/home_screen/tabs/result_tab/presentation/cubit/exam_result_state.dart';

import '../../domain/usecases/get_exam_result_use_case.dart'
    show GetExamResultUseCase;

@injectable
class ExamResultCubit extends Cubit<ExamResultState> {
  final SaveExamResultUseCase _saveExamResultUseCase;
  final GetExamResultUseCase _getExamResultUseCase;
  final GetAllExamResultsUseCase _getAllExamResultsUseCase;
  final DeleteExamResultUseCase _deleteExamResultUseCase;
  final ClearAllResultsUseCase _clearAllResultsUseCase;
  final HasExamResultUseCase _hasExamResultUseCase;
  final GetExamResultsByTitleUseCase _getExamResultsByTitleUseCase;
  final GetRecentResultsUseCase _getRecentResultsUseCase;
  ExamResultCubit({
    required SaveExamResultUseCase saveExamResultUseCase,
    required GetExamResultUseCase getExamResultUseCase,
    required GetAllExamResultsUseCase getAllExamResultsUseCase,
    required DeleteExamResultUseCase deleteExamResultUseCase,
    required ClearAllResultsUseCase clearAllResultsUseCase,
    required HasExamResultUseCase hasExamResultUseCase,
    required GetExamResultsByTitleUseCase getExamResultsByTitleUseCase,
    required GetRecentResultsUseCase getRecentResultsUseCase,
  })  : _saveExamResultUseCase = saveExamResultUseCase,
        _getExamResultUseCase = getExamResultUseCase,
        _getAllExamResultsUseCase = getAllExamResultsUseCase,
        _deleteExamResultUseCase = deleteExamResultUseCase,
        _clearAllResultsUseCase = clearAllResultsUseCase,
        _hasExamResultUseCase = hasExamResultUseCase,
        _getExamResultsByTitleUseCase = getExamResultsByTitleUseCase,
        _getRecentResultsUseCase = getRecentResultsUseCase,
        super(ExamResultInitial());

  Future<void> saveExamResult(ExamResult result) async {
    emit(ExamResultLoading());
    final response = await _saveExamResultUseCase.invoke(result);

    switch (response) {
      case ApiSuccessResult<void>():
        emit(ExamResultSaved());
        break;
      case ApiErrorResult<void>():
        emit(ExamResultError(errorMessage: response.errorMsg));
        break;
    }
  }

  Future<void> getExamResult(String examId) async {
    emit(ExamResultLoading());
    final response = await _getExamResultUseCase.invoke(examId);

    switch (response) {
      case ApiSuccessResult<ExamResult?>():
        emit(SingleExamResultLoaded(examResult: response.data));
        break;
      case ApiErrorResult<ExamResult?>():
        emit(ExamResultError(errorMessage: response.errorMsg));
        break;
    }
  }

  Future<void> getAllExamResults() async {
    emit(ExamResultLoading());
    final response = await _getAllExamResultsUseCase.invoke();

    switch (response) {
      case ApiSuccessResult<List<ExamResult>>():
        final sortedResults = response.data;
        sortedResults.sort((a, b) => b.completedAt.compareTo(a.completedAt));
        emit(AllExamResultsLoaded(examResults: sortedResults));
        break;
      case ApiErrorResult<List<ExamResult>>():
        emit(ExamResultError(errorMessage: response.errorMsg));
        break;
    }
  }

  Future<void> deleteExamResult(String examId) async {
    emit(ExamResultLoading());
    final response = await _deleteExamResultUseCase.invoke(examId);

    switch (response) {
      case ApiSuccessResult<void>():
        emit(ExamResultDeleted());
        // Refresh the list after deletion
        getAllExamResults();
        break;
      case ApiErrorResult<void>():
        emit(ExamResultError(errorMessage: response.errorMsg));
        break;
    }
  }

  Future<void> clearAllResults() async {
    emit(ExamResultLoading());
    final response = await _clearAllResultsUseCase.invoke();

    switch (response) {
      case ApiSuccessResult<void>():
        emit(AllResultsCleared());
        getAllExamResults();
        break;
      case ApiErrorResult<void>():
        emit(ExamResultError(errorMessage: response.errorMsg));
        break;
    }
  }

  Future<void> checkExamResult(String examId) async {
    final response = await _hasExamResultUseCase.invoke(examId);

    switch (response) {
      case ApiSuccessResult<bool>():
        emit(ExamResultExists(exists: response.data));
        break;
      case ApiErrorResult<bool>():
        emit(ExamResultError(errorMessage: response.errorMsg));
        break;
    }
  }

  Future<void> getExamResultsByTitle(String title) async {
    emit(ExamResultLoading());
    final response = await _getExamResultsByTitleUseCase.invoke(title);

    switch (response) {
      case ApiSuccessResult<List<ExamResult>>():
        emit(ExamResultsByTitleLoaded(examResults: response.data));
        break;
      case ApiErrorResult<List<ExamResult>>():
        emit(ExamResultError(errorMessage: response.errorMsg));
        break;
    }
  }

  Future<void> getRecentResults({int limit = 10}) async {
    emit(ExamResultLoading());
    final response = await _getRecentResultsUseCase.invoke(limit: limit);

    switch (response) {
      case ApiSuccessResult<List<ExamResult>>():
        emit(RecentExamResultsLoaded(examResults: response.data));
        break;
      case ApiErrorResult<List<ExamResult>>():
        emit(ExamResultError(errorMessage: response.errorMsg));
        break;
    }
  }
}
