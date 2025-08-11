import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/api_result/api_result.dart';
import 'package:online_exam_app/features/home_screen/tabs/profile_tab/domain/entities/response/get_user_data_response_entity.dart';
import 'package:online_exam_app/features/home_screen/tabs/profile_tab/domain/repositories/profile_repository.dart';
@injectable
class GetUserDataUseCase {
  final ProfileRepository _repository;

  GetUserDataUseCase(this._repository);

  Future<ApiResult<GetUserDataResponseEntity>> call() {
    return _repository.getUserData();
  }
}
