import 'package:online_exam_app/features/auth/domain/entities/response_entities/forget_password_response_entity.dart';
import 'package:online_exam_app/features/auth/domain/entities/response_entities/reset_password_response_entity.dart';
import 'package:online_exam_app/features/auth/domain/entities/response_entities/sign_in_response_entity.dart';
import 'package:online_exam_app/features/auth/domain/entities/response_entities/verify_reset_code_response_entity.dart';

import '../../../../core/api_result/api_result.dart';
import '../../domain/entities/request_entities/forget_password_request_entity.dart';
import '../../domain/entities/request_entities/reset_password_request_entity.dart';
import '../../domain/entities/request_entities/sign_in_request_entity.dart';
import '../../domain/entities/request_entities/sign_up_request_entity.dart';
import '../../domain/entities/request_entities/verify_reset_code_request_entity.dart';
import '../../domain/entities/response_entities/sign_up_response_entity.dart';

abstract class AuthRemoteDataSource {
  Future<ApiResult<SignInResponseEntity>> signIn(
      SignInRequestEntity signInRequest);

  Future<ApiResult<SignUpResponseEntity>> signUp(
      SignUpRequestEntity signUpRequest);

  Future<ApiResult<ForgetPasswordResponseEntity>> forgetPassword(
    ForgetPasswordRequestEntity request,
  );

  Future<ApiResult<VerifyResetCodeResponseEntity>> verifyResetCode(
    VerifyResetCodeRequestEntity request,
  );

  Future<ApiResult<ResetPasswordResponseEntity>> resetPassword(
    ResetPasswordRequestEntity request,
  );
}
