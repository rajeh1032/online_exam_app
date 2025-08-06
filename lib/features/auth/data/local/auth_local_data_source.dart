abstract class AuthLocalDataSource {
  Future<void> saveToken(String token);

  Future<String?> getToken();

  Future<void> clearToken();

  Future<void> saveRememberMe(bool rememberMe);
  Future<bool> getRememberMe();
  Future<String>saveUserName(String userName);
  Future<String?> getUserName();
  Future<void> clearUserName();

}
