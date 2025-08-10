import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/api_result/api_result.dart';
import 'package:online_exam_app/features/home_screen/tabs/profile_tab/domain/entities/request/edit_profile_request_entity.dart';
import 'package:online_exam_app/features/home_screen/tabs/profile_tab/domain/entities/response/edit_profile_response_entity.dart';
import 'package:online_exam_app/features/home_screen/tabs/profile_tab/domain/repositories/profile_repository.dart';
@injectable
class EditProfileUseCase {
  final ProfileRepository _repository;

  EditProfileUseCase(this._repository);

  Future<ApiResult<EditProfileResponseEntity>> call(
      EditProfileRequestEntity request) {
    return _repository.editProfile(request);
  }
}