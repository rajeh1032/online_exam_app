import 'package:online_exam_app/core/api_result/api_result.dart';
import 'package:online_exam_app/core/models/exam_result.dart';

abstract class ExamResultRepository {
  Future<ApiResult<void>> saveExamResult(ExamResult result);
  Future<ApiResult<ExamResult?>> getExamResult(String examId);
  Future<ApiResult<List<ExamResult>>> getAllExamResults();
  Future<ApiResult<void>> deleteExamResult(String examId);
  Future<ApiResult<void>> clearAllResults();
  Future<ApiResult<bool>> hasExamResult(String examId);
  Future<ApiResult<List<ExamResult>>> getExamResultsByTitle(String title);
  Future<ApiResult<List<ExamResult>>> getRecentResults({int limit = 10});
}
