import 'package:injectable/injectable.dart';

import '../../../../../../core/api_result/api_result.dart';
import '../entities/request/get_all_exam_on_subject_request_entity.dart';
import '../entities/response/get_all_exam_on_subject_entity.dart';
import '../repositories/home_repositories.dart';

@injectable
class GetAllExamOnSubjectUseCase {
  final HomeRepositories _homeRepositories;

  GetAllExamOnSubjectUseCase(this._homeRepositories);

  Future<ApiResult<GetAllExamOnSubjectEntity>> invoke(
          GetAllExamOnSubjectRequestEntity getAllExamOnSubjectRequestEntity) =>
      _homeRepositories.getAllExamOnSubject( getAllExamOnSubjectRequestEntity);
}
