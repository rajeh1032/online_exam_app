import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/local_storage/secure_storage_service.dart';
import 'package:online_exam_app/features/auth/data/local/auth_local_data_source.dart';

@LazySingleton(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SecureStorageService _secureStorageService;

  AuthLocalDataSourceImpl(this._secureStorageService);

  @override
  Future<void> saveToken(String token) async {
    await _secureStorageService.saveToken(token);
  }

  @override
  Future<String?>  getToken() async{
    return await _secureStorageService.getToken();
  }

  @override
  Future<void> clearToken() async {
    await _secureStorageService.deleteToken();
  }
}
