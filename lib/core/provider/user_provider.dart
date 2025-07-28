import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
@singleton
class UserProvider extends ChangeNotifier {
  String? email;
  updateUser(String newEmail) {
    email = newEmail;
    notifyListeners();
  }
}
