

import 'package:online_exam_app/presentation/features/auth/domain/entities/sign_in_response_entity.dart';

class SignUpResponseEntity {
  SignUpResponseEntity({
    required this.message,
    required this.token,
    required this.user,
  });

  final String message;
  final String token;
  final UserEntity user;
}


