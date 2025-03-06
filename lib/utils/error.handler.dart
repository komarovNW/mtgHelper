import 'package:dio/dio.dart';
import 'package:mtg_helper/core/dio_client.dart';

class ErrorHandler {
  static void handleError(Object e, Function(String) emitError) {
    String errorMessage = 'Неизвестная ошибка';

    if (e is Exception) {
      if (e is DioException) {
        if (e.error is NetworkException) {
          errorMessage = (e.error as NetworkException).message;
        } else if (e.error is ServerException) {
          errorMessage = (e.error as ServerException).message;
        } else if (e.error is TimeoutException) {
          errorMessage = (e.error as TimeoutException).message;
        } else if (e.error is UnknownException) {
          errorMessage = (e.error as UnknownException).message;
        } else if (e.error is CustomException) {
          errorMessage = (e.error as CustomException).message;
        }
      }
    }
    emitError(errorMessage);
  }
}
