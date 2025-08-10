import 'package:injectable/injectable.dart';

import '../../../../../../core/api_result/api_result.dart';
import '../entities/response/get_all_subject_response_entity.dart';
import '../repositories/home_repositories.dart';

@injectable
class GetAllSubjectUseCase {
  final HomeRepositories _homeRepositories;

  GetAllSubjectUseCase(this._homeRepositories);

  Future<ApiResult<GetAllSubjectsResponseEntity>> invoke() =>
      _homeRepositories.getAllSubjects();
}
