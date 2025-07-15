abstract class ApiEndpoint {
  static const String baseUrl = 'https://exam.elevateegy.com/api/v1';

  //Auth
  static const String signIn = '/auth/signin';
  static const String forgotPassword = '/auth/forgotPassword';
  static const String verifyResetCode = '/auth/verifyResetCode';
  static const String resetPassword = '/auth/resetPassword';

}
