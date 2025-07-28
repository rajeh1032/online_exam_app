
import 'package:injectable/injectable.dart';

import 'package:online_exam_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:online_exam_app/features/auth/domain/entities/response_entities/forget_password_response_entity.dart';
import 'package:online_exam_app/features/auth/domain/entities/response_entities/reset_password_response_entity.dart';
import 'package:online_exam_app/features/auth/domain/entities/response_entities/sign_in_response_entity.dart';
import 'package:online_exam_app/features/auth/domain/entities/response_entities/verify_reset_code_response_entity.dart';
import 'package:online_exam_app/features/auth/domain/repositories/auth_repositories.dart';

import '../../../../core/api_result/api_result.dart';
import '../../domain/entities/request_entities/forget_password_request_entity.dart';
import '../../domain/entities/request_entities/reset_password_request_entity.dart';
import '../../domain/entities/request_entities/sign_in_request_entity.dart';
import '../../domain/entities/request_entities/sign_up_request_entity.dart';
import '../../domain/entities/request_entities/verify_reset_code_request_entity.dart';
import '../../domain/entities/response_entities/sign_up_response_entity.dart';

@Injectable(as: AuthRepository)
class AuthRepositoriesImpl implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepositoriesImpl({required AuthRemoteDataSource authRemoteDataSource})
      : _authRemoteDataSource = authRemoteDataSource;

  @override
  Future<ApiResult<SignInResponseEntity>> signIn(
      SignInRequestEntity signInRequest) {
    return _authRemoteDataSource.signIn(signInRequest);
  }

  @override
  Future<ApiResult<SignUpResponseEntity>> signUp(
      SignUpRequestEntity signUpRequest) {
    return _authRemoteDataSource.signUp(signUpRequest);
  }

  @override
  Future<ApiResult<ForgetPasswordResponseEntity>> forgetPassword(
    ForgetPasswordRequestEntity request,
  ) {
    return _authRemoteDataSource.forgetPassword(request);
  }

  @override
  Future<ApiResult<VerifyResetCodeResponseEntity>> verifyResetCode(
    VerifyResetCodeRequestEntity request,
  ) {
    return _authRemoteDataSource.verifyResetCode(request);
  }

  @override
  Future<ApiResult<ResetPasswordResponseEntity>> resetPassword(
    ResetPasswordRequestEntity request,
  ) {
    return _authRemoteDataSource.resetPassword(request);
  }
}
