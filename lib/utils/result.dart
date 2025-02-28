class Result<T> {
  Result.failure(this.error) : data = null;
  Result.success(this.data) : error = null;
  final T? data;
  final String? error;

  bool get isSuccess => data != null;
  bool get isFailure => error != null;
}
