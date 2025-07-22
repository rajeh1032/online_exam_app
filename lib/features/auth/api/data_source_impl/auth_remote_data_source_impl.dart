import 'package:either_dart/src/either.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/errors/failures.dart';
import 'package:online_exam_app/core/errors/safe_api_call.dart';
import 'package:online_exam_app/features/auth/api/client/auth_api_client.dart';
import 'package:online_exam_app/features/auth/api/mapper/sign_in_response_dto_mapper.dart';
import 'package:online_exam_app/features/auth/api/mapper/sign_up_response_dto_mapper.dart';
import 'package:online_exam_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:online_exam_app/features/auth/data/local/auth_local_data_source.dart';
import 'package:online_exam_app/features/auth/domain/entities/forget_password_response_entity.dart';
import 'package:online_exam_app/features/auth/domain/entities/reset_password_response_entity.dart';
import 'package:online_exam_app/features/auth/domain/entities/sign_in_response_entity.dart';
import 'package:online_exam_app/features/auth/api/mapper/forget_password_dto_mapper.dart';
import 'package:online_exam_app/features/auth/domain/entities/verify_reset_code_response_entity.dart';
import 'package:online_exam_app/features/auth/api/mapper/verify_reset_code_dto_mapper.dart';
import 'package:online_exam_app/features/auth/api/mapper/reset_password_dto_mapper.dart';

import '../../domain/entities/sign_up_response_entity.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final AuthApiClient authApiClient;
  final AuthLocalDataSource authLocalDataSource;
  AuthRemoteDataSourceImpl(this.authApiClient,
      {required this.authLocalDataSource});

  @override
  Future<Either<Failures, SignInResponseEntity>> signIn(
      String? email, String? password) async {
    return await safeApiCall(() async {
      final response =
          await authApiClient.signIn({"email": email, "password": password});
      print("my token : ${response.token}");
      await authLocalDataSource.saveToken(response.token);
      return response.toEntity();
    });
  }

  @override
  Future<Either<Failures, SignUpResponseEntity>> signUp(
      String? username,
      String? firstName,
      String? lastName,
      String? email,
      String? password,
      String? rePassword,
      String? phone) async {
    return await safeApiCall(() async {
      final response = await authApiClient.signUp({
        "username": username,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
        "rePassword": rePassword,
        "phone": phone
      });

      return response.toEntity();
    });
  }

  @override
  Future<Either<Failures, ForgetPasswordResponseEntity>> forgetPassword(
      String? email) async {
    return await safeApiCall(() async {
      final response = await authApiClient.forgetPassword({"email": email});

      return response.toEntity();
    });
  }

  @override
  Future<Either<Failures, VerifyResetCodeResponseEntity>> verifyResetCode(
      String? resetCode) async {
    return await safeApiCall(() async {
      final response =
          await authApiClient.verifyResetCode({"resetCode": resetCode});

      return response.toEntity();
    });
  }

  @override
  Future<Either<Failures, ResetPasswordResponseEntity>> resetPassword(
      String? email, String? newPassword) async {
    return await safeApiCall(() async {
      final response = await authApiClient
          .resetPassword({"email": email, "newPassword": newPassword});

      return response.toEntity();
    });
  }
}
