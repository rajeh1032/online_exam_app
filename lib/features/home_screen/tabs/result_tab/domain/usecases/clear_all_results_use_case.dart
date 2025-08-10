import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/api_result/api_result.dart';
import 'package:online_exam_app/features/home_screen/tabs/result_tab/domain/repositories/exam_result_repository.dart';

@injectable
class ClearAllResultsUseCase {
  final ExamResultRepository examResultRepository;

  ClearAllResultsUseCase(this.examResultRepository);

  Future<ApiResult<void>> invoke() {
    return examResultRepository.clearAllResults();
  }
}