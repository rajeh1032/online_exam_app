import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/constants.dart';

@singleton
class RememberMeProvider extends ChangeNotifier {
  final SharedPreferences sharedPreferences;

  RememberMeProvider(this.sharedPreferences);

  bool get isRememberMeEnabled =>
      sharedPreferences.getBool(Constants.rememberMeKey) ?? false;

  Future<void> setRememberMe(bool value) async {
    await sharedPreferences.setBool(Constants.rememberMeKey, value);
  }

  Future<void> clearRememberMe() async {
    await sharedPreferences.remove(Constants.rememberMeKey);
  }
}
