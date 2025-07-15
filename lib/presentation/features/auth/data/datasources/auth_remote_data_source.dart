import 'package:either_dart/either.dart';
import 'package:online_exam_app/core/errors/failures.dart';
import 'package:online_exam_app/presentation/features/auth/domain/entities/forget_password_response_entity.dart';
import 'package:online_exam_app/presentation/features/auth/domain/entities/reset_password_response_entity.dart';
import 'package:online_exam_app/presentation/features/auth/domain/entities/sign_in_response_entity.dart';
import 'package:online_exam_app/presentation/features/auth/domain/entities/verify_reset_code_response_entity.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failures, SignInResponseEntity>> signIn(
    String? email,
    String? password,
  );

  Future<Either<Failures, ForgetPasswordResponseEntity>> forgetPassword(
    String? email,
  );

  Future<Either<Failures, VerifyResetCodeResponseEntity>> verifyResetCode(
    String? resetCode,
  );

  Future<Either<Failures, ResetPasswordResponseEntity>> resetPassword(
    String? email,
    String? newPassword,
  );
}
