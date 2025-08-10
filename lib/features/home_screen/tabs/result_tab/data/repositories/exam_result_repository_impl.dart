import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/api_result/api_result.dart';
import 'package:online_exam_app/core/models/exam_result.dart';
import 'package:online_exam_app/features/home_screen/tabs/result_tab/data/datasources/exam_result_local_data_source.dart';
import 'package:online_exam_app/features/home_screen/tabs/result_tab/domain/repositories/exam_result_repository.dart';

@Injectable(as: ExamResultRepository)
class ExamResultRepositoryImpl implements ExamResultRepository {
  final ExamResultLocalDataSource _examResultLocalDataSource;
  ExamResultRepositoryImpl({
    required ExamResultLocalDataSource examResultLocalDataSource,
  }) : _examResultLocalDataSource = examResultLocalDataSource;

  @override
  Future<ApiResult<void>> saveExamResult(ExamResult result) {
    return _examResultLocalDataSource.saveExamResult(result);
  }

  @override
  Future<ApiResult<bool>> hasExamResult(String examId) {
    return _examResultLocalDataSource.hasExamResult(examId);
  }

  @override
  Future<ApiResult<void>> clearAllResults() {
    return _examResultLocalDataSource.clearAllResults();
  }

  @override
  Future<ApiResult<void>> deleteExamResult(String examId) {
    return _examResultLocalDataSource.deleteExamResult(examId);
  }

  @override
  Future<ApiResult<List<ExamResult>>> getAllExamResults() {
    return _examResultLocalDataSource.getAllExamResults();
  }

  @override
  Future<ApiResult<ExamResult?>> getExamResult(String examId) {
    return _examResultLocalDataSource.getExamResult(examId);
  }

  @override
  Future<ApiResult<List<ExamResult>>> getExamResultsByTitle(String title) {
    return _examResultLocalDataSource.getExamResultsByTitle(title);
  }

  @override
  Future<ApiResult<List<ExamResult>>> getRecentResults({int limit = 10}) {
    return _examResultLocalDataSource.getRecentResults(limit: limit);
  }
}
