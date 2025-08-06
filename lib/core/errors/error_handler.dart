class ErrorHandler {
  static String getErrorKey(String error) {
    if (error.contains('SocketException')) {
      return 'no_internet';
    } else if (error.contains('TimeoutException')) {
      return 'timeout';
    } else if (error.contains('401')) {
      return 'unauthorized';
    } else if (error.contains('409')) {
      return 'username_already_exists';
    } else if (error.contains('500')) {
      return 'server_error';
    } else if (error.contains('DioError')) {
      return 'network_error';
    }
    return 'unexpected_error';
  }
}
