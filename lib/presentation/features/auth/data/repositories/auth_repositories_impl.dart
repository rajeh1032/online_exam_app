import 'package:either_dart/either.dart';
import 'package:either_dart/src/either.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/errors/failures.dart';
import 'package:online_exam_app/presentation/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:online_exam_app/presentation/features/auth/domain/entities/sign_in_response_entity.dart';
import 'package:online_exam_app/presentation/features/auth/domain/repositories/auth_repositories.dart';

import '../../domain/entities/sign_up_response_entity.dart';

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
  Future<Either<Failures, SignUpResponseEntity>> signUp(String? username, String? firstName, String? lastName, String? email, String? password, String? rePassword, String? phone) {
    var either = authRemoteDataSource.signUp(username,
      firstName,
      lastName,
      email,
      password,
      rePassword,
      phone,);
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
