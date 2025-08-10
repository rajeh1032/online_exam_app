import '../../../../../../core/api_result/api_result.dart';
import '../../domain/entities/request/change_password_request_entity.dart';
import '../../domain/entities/request/edit_profile_request_entity.dart';
import '../../domain/entities/response/change_password_response_entity.dart';
import '../../domain/entities/response/edit_profile_response_entity.dart';
import '../../domain/entities/response/get_user_data_response_entity.dart';

abstract class ProfileRemoteDataSource {
  Future<ApiResult<EditProfileResponseEntity>> editProfile(
    EditProfileRequestEntity editProfileRequestEntity,
  );

  Future<ApiResult<GetUserDataResponseEntity>> getUserData();

  Future<ApiResult<ChangePasswordResponseEntity>> changePassword(
    ChangePasswordRequestEntity changePasswordRequestEntity,
  );
}
