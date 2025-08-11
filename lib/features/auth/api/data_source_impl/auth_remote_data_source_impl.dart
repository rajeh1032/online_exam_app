import 'package:injectable/injectable.dart';

import 'package:online_exam_app/features/auth/api/client/auth_api_client.dart';
import 'package:online_exam_app/features/auth/api/mapper/sign_in_response_dto_mapper.dart';
import 'package:online_exam_app/features/auth/api/mapper/sign_up_response_dto_mapper.dart';
import 'package:online_exam_app/features/auth/api/models/forget_password_request_dto.dart';
import 'package:online_exam_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:online_exam_app/features/auth/data/local/auth_local_data_source.dart';

import 'package:online_exam_app/features/auth/domain/entities/request_entities/forget_password_request_entity.dart';
import 'package:online_exam_app/features/auth/domain/entities/response_entities/forget_password_response_entity.dart';
import 'package:online_exam_app/features/auth/domain/entities/response_entities/reset_password_response_entity.dart';
import 'package:online_exam_app/features/auth/domain/entities/response_entities/sign_in_response_entity.dart';
import 'package:online_exam_app/features/auth/api/mapper/forget_password_dto_mapper.dart';
import 'package:online_exam_app/features/auth/domain/entities/response_entities/verify_reset_code_response_entity.dart';
import 'package:online_exam_app/features/auth/api/mapper/verify_reset_code_dto_mapper.dart';
import 'package:online_exam_app/features/auth/api/mapper/reset_password_dto_mapper.dart';

import '../../../../core/api_result/api_result.dart';
import '../../../../core/errors/error_handler.dart';
import '../../domain/entities/request_entities/reset_password_request_entity.dart';
import '../../domain/entities/request_entities/sign_in_request_entity.dart';
import '../../domain/entities/request_entities/sign_up_request_entity.dart';
import '../../domain/entities/request_entities/verify_reset_code_request_entity.dart';
import '../../domain/entities/response_entities/sign_up_response_entity.dart';
import '../models/reset_password_request_dto.dart';
import '../models/sign_in_request_dto.dart';
import '../models/sign_up_request_dto.dart';
import '../models/verify_reset_code_request_dto.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final AuthApiClient _authApiClient;
  final AuthLocalDataSource _authLocalDataSource;

  AuthRemoteDataSourceImpl({
    required AuthApiClient authApiClient,
    required AuthLocalDataSource authLocalDataSource,
  })  : _authApiClient = authApiClient,
        _authLocalDataSource = authLocalDataSource;

  @override
  Future<ApiResult<SignInResponseEntity>> signIn(
      SignInRequestEntity signInRequest) async {
    try {
      var response = await _authApiClient
          .signIn(SignInRequestDto.fromDomain(signInRequest));
      if (response.token.isNotEmpty) {
        await _authLocalDataSource.saveToken(response.token);
      }
      return ApiSuccessResult(data: response.toEntity());
    } catch (e) {
      return ApiErrorResult<SignInResponseEntity>(
          errorMsg: ErrorHandler.getFriendlyMessage(e.toString()));
    }
  }

  @override
  Future<ApiResult<SignUpResponseEntity>> signUp(
      SignUpRequestEntity signUpRequest) async {
    try {
      var response = await _authApiClient
          .signUp(SignUpRequestDto.fromDomain(signUpRequest));
      return ApiSuccessResult(data: response.toEntity());
    } catch (e) {
      return ApiErrorResult<SignUpResponseEntity>(
          errorMsg: ErrorHandler.getFriendlyMessage(e.toString()));
    }
  }

  @override
  Future<ApiResult<ForgetPasswordResponseEntity>> forgetPassword(
      ForgetPasswordRequestEntity request) async {
    try {
      var response = await _authApiClient
          .forgetPassword(ForgetPasswordRequestDto.fromDomain(request));
      return ApiSuccessResult(data: response.toEntity());
    } catch (e) {
      return ApiErrorResult<ForgetPasswordResponseEntity>(
          errorMsg: ErrorHandler.getFriendlyMessage(e.toString()));
    }
  }

  @override
  Future<ApiResult<VerifyResetCodeResponseEntity>> verifyResetCode(
      VerifyResetCodeRequestEntity request) async {
    try {
      final dto = VerifyResetCodeRequestDto.fromDomain(request);
      final response = await _authApiClient.verifyResetCode(dto);
      return ApiSuccessResult(data: response.toEntity());
    } catch (e) {
      return ApiErrorResult(
          errorMsg: ErrorHandler.getFriendlyMessage(e.toString()));
    }
  }

  @override
  Future<ApiResult<ResetPasswordResponseEntity>> resetPassword(
      ResetPasswordRequestEntity request) async {
    try {
      final dto = ResetPasswordRequestDto.fromDomain(request);
      final response = await _authApiClient.resetPassword(dto);
      return ApiSuccessResult(data: response.toEntity());
    } catch (e) {
      return ApiErrorResult(
          errorMsg: ErrorHandler.getFriendlyMessage(e.toString()));
    }
  }
}
