sealed class ApiResult<T> {}

class ApiSuccessResult<T> extends ApiResult<T> {
  T data;

  ApiSuccessResult({required this.data});
}

class ApiErrorResult<T> extends ApiResult<T> {
  final String errorMsg;

  ApiErrorResult({required this.errorMsg});
}
