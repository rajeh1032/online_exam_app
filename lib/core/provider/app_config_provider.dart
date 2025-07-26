import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/constant/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class AppConfigProvider extends ChangeNotifier {
  final SharedPreferences sharedPreferences;
  AppConfigProvider(this.sharedPreferences);

  String selectedLocal = Constants.enLocalKey;
  bool isEn() => selectedLocal == Constants.enLocalKey;
  Future<void> changeLocal(String currentLocal) async {
    if (selectedLocal == currentLocal) return;
    selectedLocal = currentLocal;
    sharedPreferences.setString(
      Constants.localKey,
      selectedLocal,
    );
    notifyListeners();
  }

  ThemeMode currentTheme = ThemeMode.light;
  Future<void> changeTheme(ThemeMode newTheme) async {
    if (currentTheme == newTheme) return;
    currentTheme = newTheme;
    sharedPreferences.setString(
      Constants.themeKey,
      currentTheme.toString(),
    );
    notifyListeners();
  }

  Future<void> loadConfig() async {
    selectedLocal =
        sharedPreferences.getString(Constants.localKey) ?? Constants.enLocalKey;
    String? theme = sharedPreferences.getString(Constants.themeKey);
    if (theme != null) {
      currentTheme =
          theme == 'ThemeMode.dark' ? ThemeMode.dark : ThemeMode.light;
    }
    notifyListeners();
  }

  // remember me logic

  Future<void> saveRememberMe({
    required String email,
    required String password,
  }) async {
    await sharedPreferences.setBool(Constants.rememberMeKey, true);
    await sharedPreferences.setString(Constants.savedEmailKey, email);
    await sharedPreferences.setString(Constants.savedPasswordKey, password);
  }


  Future<void> clearRememberMe() async {
    await sharedPreferences.remove(Constants.rememberMeKey);
    await sharedPreferences.remove(Constants.savedEmailKey);
    await sharedPreferences.remove(Constants.savedPasswordKey);
  }


  bool get isRemembered =>
      sharedPreferences.getBool(Constants.rememberMeKey) ?? false;

  String? get savedEmail =>
      sharedPreferences.getString(Constants.savedEmailKey);

  String? get savedPassword =>
      sharedPreferences.getString(Constants.savedPasswordKey);

  //save user email
  Future<void> saveUserEmail(String email) async {
    await sharedPreferences.setString(Constants.savedEmailKey, email);
  }
  //get user email
  String? getUserEmail() {
    return sharedPreferences.getString(Constants.savedEmailKey);
  }

}
