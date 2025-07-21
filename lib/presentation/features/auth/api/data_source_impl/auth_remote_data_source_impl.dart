import 'package:either_dart/src/either.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/errors/failures.dart';
import 'package:online_exam_app/core/errors/safe_api_call.dart';
import 'package:online_exam_app/presentation/features/auth/api/client/auth_api_client.dart';
import 'package:online_exam_app/presentation/features/auth/api/mapper/sign_in_response_dto_mapper.dart';
import 'package:online_exam_app/presentation/features/auth/api/mapper/sign_up_response_dto_mapper.dart';
import 'package:online_exam_app/presentation/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:online_exam_app/presentation/features/auth/domain/entities/sign_in_response_entity.dart';

import '../../domain/entities/sign_up_response_entity.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final AuthApiClient authApiClient;
  AuthRemoteDataSourceImpl(this.authApiClient);

  @override
  Future<Either<Failures, SignInResponseEntity>> signIn(
      String? email, String? password) async {
    return await safeApiCall(() async {
      final response =
          await authApiClient.signIn({"email": email, "password": password});

      return response.toEntity();
    });
  }
  @override
  Future<Either<Failures, SignUpResponseEntity>> signUp(String? username, String? firstName, String? lastName, String? email, String? password,
      String? rePassword, String? phone) async{
    return await safeApiCall(() async {
      final response =
      await authApiClient.signUp({"username":username,"firstName":firstName,
        "lastName":lastName, "email":email,"password":password,"rePassword":rePassword,
        "phone":phone

      });

      return response.toEntity();
    });
  }
}
