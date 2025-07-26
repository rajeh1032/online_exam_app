import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/api_result/api_result.dart';
import 'package:online_exam_app/features/auth/domain/entities/request_entities/verify_reset_code_request_entity.dart';
import 'package:online_exam_app/features/auth/domain/entities/response_entities/verify_reset_code_response_entity.dart';
import 'package:online_exam_app/features/auth/domain/repositories/auth_repositories.dart';

@injectable
class VerifyResetCodeUseCase {
  final AuthRepository authRepository;

  VerifyResetCodeUseCase(this.authRepository);

  Future<ApiResult<VerifyResetCodeResponseEntity>> invoke(
      VerifyResetCodeRequestEntity resetCode) {
    return authRepository.verifyResetCode(resetCode);
  }
}
