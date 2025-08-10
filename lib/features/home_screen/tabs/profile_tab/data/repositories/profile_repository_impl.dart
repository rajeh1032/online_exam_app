import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/api_result/api_result.dart';
import 'package:online_exam_app/features/home_screen/tabs/profile_tab/data/datasources/profile_remote_data_source.dart';
import 'package:online_exam_app/features/home_screen/tabs/profile_tab/domain/entities/request/change_password_request_entity.dart';
import 'package:online_exam_app/features/home_screen/tabs/profile_tab/domain/entities/request/edit_profile_request_entity.dart';
import 'package:online_exam_app/features/home_screen/tabs/profile_tab/domain/entities/response/change_password_response_entity.dart';
import 'package:online_exam_app/features/home_screen/tabs/profile_tab/domain/entities/response/edit_profile_response_entity.dart';
import 'package:online_exam_app/features/home_screen/tabs/profile_tab/domain/entities/response/get_user_data_response_entity.dart';
import 'package:online_exam_app/features/home_screen/tabs/profile_tab/domain/repositories/profile_repository.dart';

@Injectable(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource _profileRemoteDataSource;

  ProfileRepositoryImpl({required ProfileRemoteDataSource profileRemoteDataSource})
      : _profileRemoteDataSource = profileRemoteDataSource;

  @override
  Future<ApiResult<EditProfileResponseEntity>> editProfile(
      EditProfileRequestEntity editProfileRequestEntity,
      ) {
    return _profileRemoteDataSource.editProfile(editProfileRequestEntity);
  }

  @override
  Future<ApiResult<GetUserDataResponseEntity>> getUserData() {
    return _profileRemoteDataSource.getUserData();
  }

  @override
  Future<ApiResult<ChangePasswordResponseEntity>> changePassword(
      ChangePasswordRequestEntity changePasswordRequestEntity,
      ) {
    return _profileRemoteDataSource.changePassword(changePasswordRequestEntity);
  }
}
