import 'package:injectable/injectable.dart';
import '../../../../core/api_result/api_result.dart';
import '../entities/request_entities/sign_up_request_entity.dart';
import '../entities/response_entities/sign_up_response_entity.dart';
import '../repositories/auth_repositories.dart';

@injectable
class SignUpUseCase {
  final AuthRepository authRepository;

  SignUpUseCase(this.authRepository);

  Future <ApiResult<SignUpResponseEntity>>invoke(SignUpRequestEntity signUpRequest){
    return authRepository.signUp(signUpRequest);
  }
}
