import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/auth/api/models/user_dto.dart';
@singleton
class UserProvider extends ChangeNotifier {
  String? email;
  updateUser(String newEmail) {
    email = newEmail;
    notifyListeners();
  }
}
