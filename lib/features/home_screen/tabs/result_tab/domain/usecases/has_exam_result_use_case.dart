import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/api_result/api_result.dart';
import 'package:online_exam_app/features/home_screen/tabs/result_tab/domain/repositories/exam_result_repository.dart';

@injectable
class HasExamResultUseCase {
  final ExamResultRepository examResultRepository;

  HasExamResultUseCase(this.examResultRepository);

  Future<ApiResult<bool>> invoke(String examId) {
    return examResultRepository.hasExamResult(examId);
  }
}
