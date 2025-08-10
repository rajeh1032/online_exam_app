import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/home_screen/tabs/profile_tab/api/models/response/change_password_response_dto.dart';
import 'package:online_exam_app/features/home_screen/tabs/profile_tab/api/models/response/get_user_data_response_dto.dart';
import 'package:retrofit/retrofit.dart';
import 'package:online_exam_app/core/api_manger/api_endpoint.dart';

import '../models/request/change_password_request_dto.dart';
import '../models/request/edit_profile_request_dto.dart';
import '../models/response/edit_profile_response_dto.dart';

part 'profile_api_client.g.dart';

@injectable
@RestApi()
abstract class ProfileApiClient {
  @factoryMethod
  factory ProfileApiClient(Dio dio) = _ProfileApiClient;

  @GET(ApiEndpoint.getUserProfile)
  Future<GetUserDataResponseDto> getUserData();

  @PUT(ApiEndpoint.editProfile)
  Future<EditProfileResponseDto> editProfile(
    @Body() EditProfileRequestDto editProfileRequestDto,
  );

  @PATCH(ApiEndpoint.changePassword)
  Future<ChangePasswordResponseDto> changePassword(
    @Body() ChangePasswordRequestDto changePasswordRequestDto,
  );
}
