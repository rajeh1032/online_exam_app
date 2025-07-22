import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/errors/failures.dart';
import '../entities/sign_up_response_entity.dart';
import '../repositories/auth_repositories.dart';

@injectable
class SignUpUseCase {
  final AuthRepository authRepository;

  SignUpUseCase(this.authRepository);

  Future<Either<Failures, SignUpResponseEntity>> signUpInvoke({
    required String? username,
    required String? firstName,
    required String? lastName,
    required String? email,
    required String? password,
    required String? rePassword,
    required String? phone,
  }) {
    return authRepository.signUp(
      username,
      firstName,
      lastName,
      email,
      password,
      rePassword,
      phone,
    );
  }
}
