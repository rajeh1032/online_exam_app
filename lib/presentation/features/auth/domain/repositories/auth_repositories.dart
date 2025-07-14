import 'package:either_dart/either.dart';
import 'package:online_exam_app/core/errors/failures.dart';
import 'package:online_exam_app/presentation/features/auth/domain/entities/sign_in_response_entity.dart';

abstract class AuthRepository {
  Future<Either<Failures, SignInResponseEntity>> signIn(
    String? email,
    String? password,
  );
  
}
