import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/api_result/api_result.dart';

import 'package:online_exam_app/features/auth/domain/entities/request_entities/forget_password_request_entity.dart';
import 'package:online_exam_app/features/auth/domain/entities/response_entities/forget_password_response_entity.dart';
import 'package:online_exam_app/features/auth/domain/repositories/auth_repositories.dart';

@injectable
class ForgetPasswordUseCase {
  final AuthRepository authRepository;

  ForgetPasswordUseCase(this.authRepository);

  Future<ApiResult<ForgetPasswordResponseEntity>> invoke(
      ForgetPasswordRequestEntity request) {
    return authRepository.forgetPassword(request);
  }
}
