import 'package:online_exam_app/core/constant/error_messages.dart';

class ErrorHandler {
  static String getFriendlyMessage(String error) {
    if (error.contains('SocketException')) {
      return ErrorMessages.noInternet;
    } else if (error.contains('TimeoutException')) {
      return ErrorMessages.timeout;
    } else if (error.contains('401')) {
      return ErrorMessages.unauthorized;
    } else if (error.contains('500')) {
      return ErrorMessages.serverError;
    } else if (error.contains('DioError')) {
      return ErrorMessages.networkError;
    }
    return ErrorMessages.unexpected;
  }
}
