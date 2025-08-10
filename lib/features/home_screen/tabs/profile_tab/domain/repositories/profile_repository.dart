import 'package:online_exam_app/core/api_result/api_result.dart';
import 'package:online_exam_app/features/home_screen/tabs/profile_tab/domain/entities/request/edit_profile_request_entity.dart';
import 'package:online_exam_app/features/home_screen/tabs/profile_tab/domain/entities/response/edit_profile_response_entity.dart';
import 'package:online_exam_app/features/home_screen/tabs/profile_tab/domain/entities/response/get_user_data_response_entity.dart';

import '../entities/request/change_password_request_entity.dart';
import '../entities/response/change_password_response_entity.dart';

abstract class ProfileRepository {
  Future<ApiResult<EditProfileResponseEntity>> editProfile(
    EditProfileRequestEntity editProfileRequestEntity,
  );

  Future<ApiResult<GetUserDataResponseEntity>>getUserData();

  Future<ApiResult<ChangePasswordResponseEntity>> changePassword(
    ChangePasswordRequestEntity changePasswordRequestEntity,
  );
}
