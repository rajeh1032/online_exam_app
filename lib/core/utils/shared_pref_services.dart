import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class SharedPrefService {
  final SharedPreferences _prefs;

  SharedPrefService(this._prefs);

  static const String tokenKey = 'tokenKey';

  // todo : login =>
  String? getToken() => _prefs.getString(tokenKey);

  Future<void> setToken(String token) async =>
      await _prefs.setString(tokenKey, token);

  Future<void> clearToken() async => await _prefs.remove(tokenKey);
}
