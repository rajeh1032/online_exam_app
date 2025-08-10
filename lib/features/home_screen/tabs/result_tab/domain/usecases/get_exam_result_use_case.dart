import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/api_result/api_result.dart';
import 'package:online_exam_app/core/models/exam_result.dart';
import 'package:online_exam_app/features/home_screen/tabs/result_tab/domain/repositories/exam_result_repository.dart';

@injectable
class GetExamResultUseCase {
  final ExamResultRepository examResultRepository;

  GetExamResultUseCase(this.examResultRepository);

  Future<ApiResult<ExamResult?>> invoke(String examId) {
    return examResultRepository.getExamResult(examId);
  }
}
