import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/api_result/api_result.dart';
import 'package:online_exam_app/core/errors/error_handler.dart';
import 'package:online_exam_app/features/home_screen/tabs/profile_tab/api/client/profile_api_client.dart';
import 'package:online_exam_app/features/home_screen/tabs/profile_tab/api/mappers/change_password_response_dto_mapper.dart';
import 'package:online_exam_app/features/home_screen/tabs/profile_tab/api/mappers/edit_profile_response_dto_mapper.dart';
import 'package:online_exam_app/features/home_screen/tabs/profile_tab/api/mappers/get_user_data_response_dto_mapper.dart';
import 'package:online_exam_app/features/home_screen/tabs/profile_tab/api/models/request/change_password_request_dto.dart';
import 'package:online_exam_app/features/home_screen/tabs/profile_tab/api/models/request/edit_profile_request_dto.dart';
import 'package:online_exam_app/features/home_screen/tabs/profile_tab/domain/entities/request/change_password_request_entity.dart';
import 'package:online_exam_app/features/home_screen/tabs/profile_tab/domain/entities/request/edit_profile_request_entity.dart';
import 'package:online_exam_app/features/home_screen/tabs/profile_tab/domain/entities/response/change_password_response_entity.dart';
import 'package:online_exam_app/features/home_screen/tabs/profile_tab/domain/entities/response/edit_profile_response_entity.dart';
import 'package:online_exam_app/features/home_screen/tabs/profile_tab/domain/entities/response/get_user_data_response_entity.dart';

import '../../data/datasources/profile_remote_data_source.dart';

@Injectable(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl extends ProfileRemoteDataSource {
  final ProfileApiClient _profileApiClient;

  ProfileRemoteDataSourceImpl({required ProfileApiClient profileApiClient})
      : _profileApiClient = profileApiClient;

  @override
  Future<ApiResult<EditProfileResponseEntity>> editProfile(
    EditProfileRequestEntity editProfileRequestEntity,
  ) async {
    try {
      final response = await _profileApiClient.editProfile(
          EditProfileRequestDto.fromDomain(editProfileRequestEntity));
      return ApiSuccessResult(data: response.toEntity());
    } catch (e) {
      return ApiErrorResult<EditProfileResponseEntity>(
        errorMsg: ErrorHandler.getFriendlyMessage(e.toString()),
      );
    }
  }

  @override
  Future<ApiResult<GetUserDataResponseEntity>> getUserData() async {
    try {
      final response = await _profileApiClient.getUserData();
      return ApiSuccessResult(data: response.toEntity());
    } catch (e) {
      return ApiErrorResult<GetUserDataResponseEntity>(
        errorMsg: ErrorHandler.getFriendlyMessage(e.toString()),
      );
    }
  }

  @override
  Future<ApiResult<ChangePasswordResponseEntity>> changePassword(
    ChangePasswordRequestEntity changePasswordRequestEntity,
  ) async {
    try {
      final response = await _profileApiClient.changePassword(
          ChangePasswordRequestDto.fromDomain(changePasswordRequestEntity));
      return ApiSuccessResult(data: response.toEntity());
    } catch (e) {
      return ApiErrorResult<ChangePasswordResponseEntity>(
        errorMsg: ErrorHandler.getFriendlyMessage(e.toString()),
      );
    }
  }
}
