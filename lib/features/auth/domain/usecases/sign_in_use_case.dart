import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/errors/failures.dart';
import 'package:online_exam_app/features/auth/domain/entities/sign_in_response_entity.dart';
import 'package:online_exam_app/features/auth/domain/repositories/auth_repositories.dart';

@injectable
class SignInUseCase {
  final AuthRepository authRepository;

  SignInUseCase(this.authRepository);

  Future<Either<Failures, SignInResponseEntity>> signInInvoke(
      {required String? email, required String? password}) {
    return authRepository.signIn(email, password);
  }
}
