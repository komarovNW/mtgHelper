class AuthException implements Exception {
  AuthException({
    this.code,
    this.originalMessage,
    this.stackTrace,
  }) {
    userMessage = _getErrorMessage(code);
  }
  final String? code;
  final String? originalMessage;
  final StackTrace? stackTrace;

  late final String userMessage;

  @override
  String toString() =>
      'AuthException($code): $originalMessage\nUserMessage: $userMessage';

  String _getErrorMessage(String? code) {
    switch (code) {
      case 'invalid-email':
        return 'Некорректный email';
      case 'user-not-found':
        return 'Пользователь не найден';
      case 'wrong-password':
        return 'Неверный пароль';
      case 'too-many-requests':
        return 'Слишком много попыток. Попробуйте позже.';
      case 'invalid-credential':
        return 'Неправильный логин или пароль';
      case 'network-request-failed':
        return 'Проблема с сетью. Проверьте подключение.';
      default:
        return 'Ошибка авторизации. Попробуйте позже.';
    }
  }
}
