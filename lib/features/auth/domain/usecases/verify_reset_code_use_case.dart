import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/errors/failures.dart';
import 'package:online_exam_app/features/auth/domain/entities/verify_reset_code_response_entity.dart';
import 'package:online_exam_app/features/auth/domain/repositories/auth_repositories.dart';

@injectable
class VerifyResetCodeUseCase {
  final AuthRepository authRepository;

  VerifyResetCodeUseCase(this.authRepository);

  Future<Either<Failures, VerifyResetCodeResponseEntity>> invoke(
      {required String? resetCode}) {
    return authRepository.verifyResetCode(resetCode);
  }
}
