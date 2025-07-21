import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/errors/failures.dart';
import 'package:online_exam_app/presentation/features/auth/domain/entities/reset_password_response_entity.dart';
import 'package:online_exam_app/presentation/features/auth/domain/repositories/auth_repositories.dart';

@injectable
class ResetPasswordUseCase {
  final AuthRepository authRepository;

  ResetPasswordUseCase(this.authRepository);

  Future<Either<Failures, ResetPasswordResponseEntity>> invoke(
      {required String? email, required String? newPassword}) {
    return authRepository.resetPassword(email, newPassword);
  }
}
