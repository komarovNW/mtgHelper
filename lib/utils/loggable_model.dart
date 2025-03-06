import 'package:firebase_crashlytics/firebase_crashlytics.dart';

abstract class LoggableModel {
  static void logError(
    String modelName,
    dynamic json,
    Object error,
    StackTrace stackTrace,
  ) {
    FirebaseCrashlytics.instance.recordError(
      error,
      stackTrace,
      reason: 'Ошибка при парсинге $modelName',
      information: <Object>[json.toString()],
    );
  }
}
