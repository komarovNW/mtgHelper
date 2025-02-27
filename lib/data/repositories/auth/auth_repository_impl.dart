import 'package:firebase_auth/firebase_auth.dart';
import 'package:mtg_helper/data/datasources/auth/auth_remote_data_source.dart';
import 'package:mtg_helper/domain/repositories/auth/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({required AuthRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;
  final AuthRemoteDataSource _remoteDataSource;

  @override
  Future<User> signIn(String email, String password) {
    return _remoteDataSource.signInWithEmailAndPassword(email, password);
  }
}
