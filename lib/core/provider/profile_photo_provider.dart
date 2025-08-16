import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/constants.dart';
@singleton
class ProfilePhotoProvider extends ChangeNotifier {
  static const _profilePhotoKey = Constants.profilePhotoPath;
  final SharedPreferences _prefs;

  String? _photoPath;
  String? get photoPath => _photoPath;

  ProfilePhotoProvider(this._prefs) {
    _loadPhoto();
  }

  void _loadPhoto() {
    _photoPath = _prefs.getString(_profilePhotoKey);
    notifyListeners();
  }

  Future<void> setPhoto(String path) async {
    _photoPath = path;
    await _prefs.setString(_profilePhotoKey, path);
    notifyListeners();
  }

  Future<void> clearPhoto() async {
    _photoPath = null;
    await _prefs.remove(_profilePhotoKey);
    notifyListeners();
  }
}
