import 'package:firebase_auth/firebase_auth.dart';
import 'package:mtg_helper/data/datasources/registration_remote_data_source.dart';
import 'package:mtg_helper/domain/repositories/registration_repository.dart';

class RegistrationRepositoryImpl implements RegistrationRepository {
  RegistrationRepositoryImpl({
    required RegistrationRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;
  final RegistrationRemoteDataSource _remoteDataSource;

  @override
  Future<User> registration(String email, String password, String displayName) {
    return _remoteDataSource.registration(email, password, displayName);
  }
}
