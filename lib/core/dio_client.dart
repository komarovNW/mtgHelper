import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'dart:async';

class DioService {
  DioService(this._dio) {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          // final String userId = _getCurrentUserId();
          // final String email = _getCurrentUserEmail();
          // debugPrint(
          //   '➡️ [$email - $userId] Request: ${options.method} ${options.uri}',
          // );
          return handler.next(options);
        },
        onResponse:
            (Response<dynamic> response, ResponseInterceptorHandler handler) {
          // final String userId = _getCurrentUserId();
          // final String email = _getCurrentUserEmail();
          // debugPrint(
          //   '✅ [$email - $userId] Response: ${response.statusCode} ${response.data}',
          // );
          return handler.next(response);
        },
        onError: (DioException e, ErrorInterceptorHandler handler) {
          _handleError(e, handler);
        },
      ),
    );
  }

  final Dio _dio;

  Future<Response<dynamic>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await _dio.get(
        path,
        queryParameters: queryParameters,
      );
    } on DioException catch (e, stackTrace) {
      _logError(
        e,
        stackTrace,
        CustomException(
          message: 'Ошибка типа: ${e.type}',
          errorDetails: e.message,
          stackTrace: StackTrace.current,
          requestUrl: e.requestOptions.uri.toString(),
        ),
      );
      rethrow;
    }
  }

  void _handleError(DioException e, ErrorInterceptorHandler handler) {
    final CustomException customException = CustomException(
      message: 'Ошибка типа: ${e.type}',
      errorDetails: e.message,
      stackTrace: StackTrace.current,
      requestUrl: e.requestOptions.uri.toString(),
    );

    final Map<DioExceptionType, void Function()> errorHandlers =
        <DioExceptionType, void Function()>{
      DioExceptionType.connectionError: () =>
          _rejectError(e, handler, NetworkException('Нет подключения к сети')),
      DioExceptionType.badResponse: () {
        final Object statusCode =
            e.response?.statusCode ?? 'неизвестный статус';
        _rejectError(
          e,
          handler,
          ServerException('Ошибка на сервере: $statusCode'),
        );
      },
      DioExceptionType.connectionTimeout: () =>
          _rejectError(e, handler, TimeoutException('Тайм-аут подключения')),
      DioExceptionType.receiveTimeout: () => _rejectError(
            e,
            handler,
            TimeoutException('Тайм-аут получения данных'),
          ),
      DioExceptionType.sendTimeout: () => _rejectError(
            e,
            handler,
            TimeoutException('Тайм-аут отправки данных'),
          ),
      DioExceptionType.unknown: () =>
          _rejectError(e, handler, UnknownException('Неизвестная ошибка')),
    };
    _logError(e, StackTrace.current, customException);
    if (errorHandlers.containsKey(e.type)) {
      errorHandlers[e.type]!();
    } else {
      handler.next(e);
    }
  }

  void _rejectError(
    DioException e,
    ErrorInterceptorHandler handler,
    Exception customException,
  ) {
    handler.reject(
      DioException(
        requestOptions: e.requestOptions,
        error: customException,
        type: e.type,
      ),
    );
  }

  void _logError(
    DioException e,
    StackTrace stackTrace,
    CustomException customException,
  ) {
    final String userId = _getCurrentUserId();
    // final String email = _getCurrentUserEmail();
    // final String errorMessage =
    //     '❌ [$email - $userId] Dio Error: ${e.type} - ${e.message}\n${e.error}';

    // debugPrint(errorMessage);
    FirebaseCrashlytics.instance.setUserIdentifier(userId);
    FirebaseCrashlytics.instance.setCustomKey(
      'custom_message',
      customException.message,
    );
    FirebaseCrashlytics.instance.setCustomKey(
      'error_details',
      customException.errorDetails ?? 'No details',
    );
    FirebaseCrashlytics.instance.setCustomKey(
      'stack_trace',
      customException.stackTrace.toString(),
    );
    FirebaseCrashlytics.instance
        .recordError(e, stackTrace, reason: customException.message);
  }

  String _getCurrentUserId() {
    final User? user = FirebaseAuth.instance.currentUser;
    return user?.uid ?? 'Гость';
  }

  // String _getCurrentUserEmail() {
  //   final String? email = FirebaseAuth.instance.currentUser?.email;
  //   return email ?? 'Неопознанный ';
  // }
}

class NetworkException implements Exception {
  NetworkException(this.message);
  final String message;
}

class ServerException implements Exception {
  ServerException(this.message);
  final String message;
}

class TimeoutException implements Exception {
  TimeoutException(this.message);
  final String message;
}

class UnknownException implements Exception {
  UnknownException(this.message);
  final String message;
}

class CustomException implements Exception {
  CustomException({
    required this.message,
    this.errorDetails,
    this.stackTrace,
    this.requestUrl,
  });

  final String message;
  final String? errorDetails;
  final StackTrace? stackTrace;
  final String? requestUrl;

  @override
  String toString() {
    return 'CustomException: $message, Details: $errorDetails';
  }
}
