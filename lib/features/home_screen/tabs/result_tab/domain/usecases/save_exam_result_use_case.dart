import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/api_result/api_result.dart';
import 'package:online_exam_app/core/models/exam_result.dart';
import 'package:online_exam_app/features/home_screen/tabs/result_tab/domain/repositories/exam_result_repository.dart';

@injectable
class SaveExamResultUseCase {
  final ExamResultRepository examResultRepository;
  SaveExamResultUseCase(this.examResultRepository);

  Future<ApiResult<void>> invoke(ExamResult result) {
    return examResultRepository.saveExamResult(result);
  }
}
