import 'package:firebase_auth/firebase_auth.dart';
import 'package:mtg_helper/data/datasources/auth_remote_data_source.dart';
import 'package:mtg_helper/domain/repositories/auth_repository.dart';
import 'package:mtg_helper/extension/auth_exception.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required AuthRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;
  final AuthRemoteDataSource _remoteDataSource;

  @override
  Future<User> signIn(String email, String password) async {
    try {
      final User? user =
          await _remoteDataSource.signInWithEmail(email, password);
      if (user == null) {
        throw AuthException(originalMessage: 'Пользователь не найден');
      }
      return user;
    } on AuthException {
      rethrow;
    } catch (e) {
      throw AuthException(originalMessage: 'Ошибка в репозитории: $e');
    }
  }
}
