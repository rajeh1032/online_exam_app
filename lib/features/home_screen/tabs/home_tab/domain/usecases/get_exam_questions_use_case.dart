import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/api_result/api_result.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/domain/entities/request/get_exam_questions_request_Entity.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/domain/entities/response/get_exam_questions_response_entity.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/domain/repositories/home_repositories.dart';

@injectable
class GetExamQuestionsUseCase {
  HomeRepositories homeRepositories;
  GetExamQuestionsUseCase(this.homeRepositories);
  Future<ApiResult<GetExamQuestionsResponseEntity>> invoke(
          {required GetExamQuestionsRequestEntity
              getExamQuestionsRequestEntity}) =>
      homeRepositories.getExamQuestions(getExamQuestionsRequestEntity);
}
