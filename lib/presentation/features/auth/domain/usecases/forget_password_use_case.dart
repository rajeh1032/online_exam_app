import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/errors/failures.dart';
import 'package:online_exam_app/presentation/features/auth/domain/entities/forget_password_response_entity.dart';
import 'package:online_exam_app/presentation/features/auth/domain/repositories/auth_repositories.dart';

@injectable
class ForgetPasswordUseCase {
  final AuthRepository authRepository;

  ForgetPasswordUseCase(this.authRepository);

  Future<Either<Failures, ForgetPasswordResponseEntity>> invoke(
      {required String? email}) {
    return authRepository.forgetPassword(email);
  }
}
