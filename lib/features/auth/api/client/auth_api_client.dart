import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/api_manger/api_endpoint.dart';
import 'package:online_exam_app/features/auth/api/models/response/forget_password_response_dto.dart';
import 'package:online_exam_app/features/auth/api/models/response/reset_password_response_dto.dart';
import 'package:online_exam_app/features/auth/api/models/response/sign_in_response_dto.dart';
import 'package:online_exam_app/features/auth/api/models/response/verify_reset_code_response_dto.dart';
import 'package:retrofit/retrofit.dart';

import '../models/forget_password_request_dto.dart';
import '../models/reset_password_request_dto.dart';
import '../models/response/sign_up_response_dto.dart';
import '../models/sign_in_request_dto.dart';
import '../models/sign_up_request_dto.dart';
import '../models/verify_reset_code_request_dto.dart';

part 'auth_api_client.g.dart';

@injectable
@RestApi()
abstract class AuthApiClient {
  @factoryMethod
  factory AuthApiClient(Dio dio) = _AuthApiClient;

  @POST(ApiEndpoint.signIn)
  Future<SignInResponseDto> signIn(@Body() SignInRequestDto signInRequest);
  @POST(ApiEndpoint.signUp)
  Future<SignUpResponseDto> signUp(@Body() SignUpRequestDto signUpRequest);


  @POST(ApiEndpoint.forgotPassword)
  Future<ForgetPasswordResponseDto> forgetPassword(
      @Body() ForgetPasswordRequestDto forgetPasswordRequest);

  @POST(ApiEndpoint.verifyResetCode)
  Future<VerifyResetCodeResponseDto> verifyResetCode(
      @Body()  VerifyResetCodeRequestDto verifyResetCodeRequest);

  @PUT(ApiEndpoint.resetPassword)
  Future<ResetPasswordResponseDto> resetPassword(
      @Body() ResetPasswordRequestDto resetPasswordRequest);
}
