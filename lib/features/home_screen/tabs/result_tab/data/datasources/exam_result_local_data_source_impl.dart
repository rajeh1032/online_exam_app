import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/api_result/api_result.dart';
import 'package:online_exam_app/core/errors/error_handler.dart';
import 'package:online_exam_app/core/models/exam_result.dart';
import 'package:online_exam_app/core/utils/exam_result_storage.dart';
import 'package:online_exam_app/features/home_screen/tabs/result_tab/data/datasources/exam_result_local_data_source.dart';

@Injectable(as: ExamResultLocalDataSource)
class ExamResultLocalDataSourceImpl implements ExamResultLocalDataSource {
  @override
  Future<ApiResult<void>> saveExamResult(ExamResult result) async {
    try {
      await ExamResultStorage.saveExamResult(result);
      return ApiSuccessResult(data: null);
    } catch (e) {
      return ApiErrorResult<void>(
          errorMsg: ErrorHandler.getFriendlyMessage(e.toString()));
    }
  }

  @override
  Future<ApiResult<ExamResult?>> getExamResult(String examId) async {
    try {
      final result = ExamResultStorage.getExamResult(examId);
      return ApiSuccessResult(data: result);
    } catch (e) {
      return ApiErrorResult<ExamResult?>(
          errorMsg: ErrorHandler.getFriendlyMessage(e.toString()));
    }
  }

  @override
  Future<ApiResult<List<ExamResult>>> getAllExamResults() async {
    try {
      final results = ExamResultStorage.getAllExamResults();
      return ApiSuccessResult(data: results);
    } catch (e) {
      return ApiErrorResult<List<ExamResult>>(
          errorMsg: ErrorHandler.getFriendlyMessage(e.toString()));
    }
  }

  @override
  Future<ApiResult<void>> deleteExamResult(String examId) async {
    try {
      await ExamResultStorage.deleteExamResult(examId);
      return ApiSuccessResult(data: null);
    } catch (e) {
      return ApiErrorResult<void>(
          errorMsg: ErrorHandler.getFriendlyMessage(e.toString()));
    }
  }

  @override
  Future<ApiResult<void>> clearAllResults() async {
    try {
      await ExamResultStorage.clearAllResults();
      return ApiSuccessResult(data: null);
    } catch (e) {
      return ApiErrorResult<void>(
          errorMsg: ErrorHandler.getFriendlyMessage(e.toString()));
    }
  }

  @override
  Future<ApiResult<bool>> hasExamResult(String examId) async {
    try {
      final hasResult = ExamResultStorage.hasExamResult(examId);
      return ApiSuccessResult(data: hasResult);
    } catch (e) {
      return ApiErrorResult<bool>(
          errorMsg: ErrorHandler.getFriendlyMessage(e.toString()));
    }
  }

  @override
  Future<ApiResult<List<ExamResult>>> getExamResultsByTitle(
      String title) async {
    try {
      final results = ExamResultStorage.getExamResultsByTitle(title);
      return ApiSuccessResult(data: results);
    } catch (e) {
      return ApiErrorResult<List<ExamResult>>(
          errorMsg: ErrorHandler.getFriendlyMessage(e.toString()));
    }
  }

  @override
  Future<ApiResult<List<ExamResult>>> getRecentResults({int limit = 10}) async {
    try {
      final results = ExamResultStorage.getRecentResults(limit: limit);
      return ApiSuccessResult(data: results);
    } catch (e) {
      return ApiErrorResult<List<ExamResult>>(
          errorMsg: ErrorHandler.getFriendlyMessage(e.toString()));
    }
  }
}
