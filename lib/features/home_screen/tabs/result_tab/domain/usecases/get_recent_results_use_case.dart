import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/api_result/api_result.dart';
import 'package:online_exam_app/core/models/exam_result.dart';
import 'package:online_exam_app/features/home_screen/tabs/result_tab/domain/repositories/exam_result_repository.dart';
@injectable
class GetRecentResultsUseCase {
  final ExamResultRepository examResultRepository;

  GetRecentResultsUseCase(this.examResultRepository);

  Future<ApiResult<List<ExamResult>>> invoke({int limit = 10}) {
    return examResultRepository.getRecentResults(limit: limit);
  }
}