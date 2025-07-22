import 'package:online_exam_app/features/auth/api/models/user_dto.dart';

class SignInResponseEntity {
  SignInResponseEntity({
    required this.message,
    required this.token,
    required this.user,
  });

  final String message;
  final String token;
  final UserEntity user;
}

class UserEntity {
  final String id;
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String role;
  final bool isVerified;
  final String createdAt;
  final String? passwordResetCode;
  final String? passwordResetExpires;
  final bool? resetCodeVerified;

  UserEntity({
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.role,
    required this.isVerified,
    required this.createdAt,
     this.passwordResetCode,
     this.passwordResetExpires,
     this.resetCodeVerified,
  });
}
