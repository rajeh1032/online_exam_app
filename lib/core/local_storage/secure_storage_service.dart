import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/constant/constants.dart';

@lazySingleton
class SecureStorageService {
  final FlutterSecureStorage _secureStorage;

  SecureStorageService(this._secureStorage);

  static const _tokenKey = Constants.authToken;

  Future<void> saveToken(String token) async {
    await _secureStorage.write(key: _tokenKey, value: token);
  }

  Future<String?> getToken() async {
    return await _secureStorage.read(key: _tokenKey);
  }

  Future<void> deleteToken() async {
    await _secureStorage.delete(key: _tokenKey);
  }
  Future<void> setBool(String key, bool value) async {
    await _secureStorage.write(key: key, value: value.toString());
  }
  Future<bool?> getBool(String key) async {
    final value = await _secureStorage.read(key: key);
    return value != null ? value.toLowerCase() == 'true' : null;
  }
  Future<void> setString(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }
  Future<String?> getString(String key) async {
    return await _secureStorage.read(key: key);
  }
  Future<void> deleteKey(String key) async {
    await _secureStorage.delete(key: key);
  }
}
