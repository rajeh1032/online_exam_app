import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/api_manger/api_endpoint.dart';
import 'package:online_exam_app/features/auth/api/models/response/forget_password_response_dto.dart';
import 'package:online_exam_app/features/auth/api/models/response/reset_password_response_dto.dart';
import 'package:online_exam_app/features/auth/api/models/response/sign_in_response_dto.dart';
import 'package:online_exam_app/features/auth/api/models/response/verify_reset_code_response_dto.dart';
import 'package:online_exam_app/features/auth/presentation/auth/pages/reset_password.dart';
import 'package:retrofit/retrofit.dart';

import '../models/response/sign_up_response_dto.dart';

part 'auth_api_client.g.dart';

@injectable
@RestApi()
abstract class AuthApiClient {
  @factoryMethod
  factory AuthApiClient(Dio dio) = _AuthApiClient;

  @POST(ApiEndpoint.signIn)
  Future<SignInResponseDto> signIn(@Body() Map<String, dynamic> body);
  @POST(ApiEndpoint.signUp)
  Future<SignUpResponseDto> signUp(@Body() Map<String, dynamic> body);


  @POST(ApiEndpoint.forgotPassword)
  Future<ForgetPasswordResponseDto> forgetPassword(
      @Body() Map<String, dynamic> body);

  @POST(ApiEndpoint.verifyResetCode)
  Future<VerifyResetCodeResponseDto> verifyResetCode(
      @Body() Map<String, dynamic> body);

  @PUT(ApiEndpoint.resetPassword)
  Future<ResetPasswordResponseDto> resetPassword(
      @Body() Map<String, dynamic> body);
}
