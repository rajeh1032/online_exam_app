import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/api_result/api_result.dart';
import 'package:online_exam_app/features/home_screen/tabs/profile_tab/domain/entities/request/change_password_request_entity.dart';
import 'package:online_exam_app/features/home_screen/tabs/profile_tab/domain/entities/response/change_password_response_entity.dart';
import 'package:online_exam_app/features/home_screen/tabs/profile_tab/domain/repositories/profile_repository.dart';
@injectable
class ChangePasswordUseCase {
  final ProfileRepository _repository;

  ChangePasswordUseCase(this._repository);

  Future<ApiResult<ChangePasswordResponseEntity>> call(
      ChangePasswordRequestEntity request) {
    return _repository.changePassword(request);
  }
}
