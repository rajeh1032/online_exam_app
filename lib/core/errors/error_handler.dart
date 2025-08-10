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

    // Local storage errors (add these to your existing class)
    else if (error.contains('HiveError') || error.contains('Box not found')) {
      return ErrorMessages.localStorage;
    } else if (error.contains('Permission denied')) {
      return ErrorMessages.storagePermission;
    } else if (error.contains('No space left') ||
        error.contains('disk space')) {
      return ErrorMessages.storageFull;
    } else if (error.contains('FormatException')) {
      return ErrorMessages.dataCorrupted;
    }
    return ErrorMessages.unexpected;
  }
}

