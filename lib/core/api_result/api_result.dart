sealed class ApiResult<T> {}

class ApiSuccessResult<T> extends ApiResult<T> {
  T data;

  ApiSuccessResult(this.data);
}

class ApiErrorResult<T> extends ApiResult<T> {
  String message;

  ApiErrorResult(this.message);
}
