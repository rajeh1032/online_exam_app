import 'package:either_dart/either.dart';
import 'package:either_dart/src/either.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/errors/failures.dart';
import 'package:online_exam_app/presentation/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:online_exam_app/presentation/features/auth/domain/entities/forget_password_response_entity.dart';
import 'package:online_exam_app/presentation/features/auth/domain/entities/reset_password_response_entity.dart';
import 'package:online_exam_app/presentation/features/auth/domain/entities/sign_in_response_entity.dart';
import 'package:online_exam_app/presentation/features/auth/domain/entities/verify_reset_code_response_entity.dart';
import 'package:online_exam_app/presentation/features/auth/domain/repositories/auth_repositories.dart';

@Injectable(as: AuthRepository)
class AuthRepositoriesImpl implements AuthRepository {
  AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoriesImpl(this.authRemoteDataSource);
  @override
  Future<Either<Failures, SignInResponseEntity>> signIn(
      String? email, String? password) {
    var either = authRemoteDataSource.signIn(email, password);
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, ForgetPasswordResponseEntity>> forgetPassword(
      String? email) async {
    var either = authRemoteDataSource.forgetPassword(email);
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, VerifyResetCodeResponseEntity>> verifyResetCode(
      String? resetCode) async {
    var either = authRemoteDataSource.verifyResetCode(resetCode);
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, ResetPasswordResponseEntity>> resetPassword(
      String? email, String? newPassword) async {
    var either = authRemoteDataSource.resetPassword(email, newPassword);
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
