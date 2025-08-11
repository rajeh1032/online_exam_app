import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/auth/domain/entities/response_entities/sign_in_response_entity.dart';
import 'package:online_exam_app/features/auth/domain/repositories/auth_repositories.dart';

import '../../../../core/api_result/api_result.dart';
import '../entities/request_entities/sign_in_request_entity.dart';

@injectable
class SignInUseCase {
  final AuthRepository authRepository;

  SignInUseCase(this.authRepository);

  Future<ApiResult<SignInResponseEntity>> invoke(
      SignInRequestEntity signInRequest) {
    return authRepository.signIn(signInRequest);
  }
}
