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
}
