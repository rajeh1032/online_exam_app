import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/utils/shared_pref_services.dart';
import 'package:online_exam_app/features/auth/data/local/auth_local_data_source.dart';

@LazySingleton(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPrefService _sharedPrefService;

  AuthLocalDataSourceImpl(this._sharedPrefService);

  @override
  Future<void> saveToken(String token) async {
    await _sharedPrefService.setToken(token);
  }

  @override
  String? getToken() {
    return _sharedPrefService.getToken();
  }

  @override
  Future<void> clearToken() async {
    await _sharedPrefService.clearToken();
  }
}
