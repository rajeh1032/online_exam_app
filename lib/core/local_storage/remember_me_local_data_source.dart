import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/constant/constants.dart';

@lazySingleton
class RememberMeLocalDataSource {
  final FlutterSecureStorage secureStorage;

  RememberMeLocalDataSource(this.secureStorage);
   Future<void> saveUserEmail(String email) async {
    await secureStorage.write(key: Constants.savedEmailKey, value: email);
  }

  Future<void> saveRememberMe({
    required String email,
    required String password,
  }) async {
    await secureStorage.write(key: Constants.rememberMeKey, value: Constants.trueString);
    saveUserEmail(email);
    await secureStorage.write(key: Constants.savedPasswordKey, value: password);
  }


  Future<void> clearRememberMe() async {
    await secureStorage.delete(key: Constants.rememberMeKey);
    await secureStorage.delete(key: Constants.savedEmailKey);
    await secureStorage.delete(key: Constants.savedPasswordKey);
  }

  Future<bool> get isRemembered async {
    final remembered = await secureStorage.read(key: Constants.rememberMeKey);
    return remembered == Constants.trueString;
  }

  Future<String?> getSavedEmail() async =>
      await secureStorage.read(key: Constants.savedEmailKey);

  Future<String?> getSavedPassword() async =>
      await secureStorage.read(key: Constants.savedPasswordKey);



}
