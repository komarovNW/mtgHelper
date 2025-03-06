import 'package:mtg_helper/data/datasources/search_remote_data_source.dart';
import 'package:mtg_helper/data/models/search_card_model.dart';
import 'package:mtg_helper/domain/repositories/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  SearchRepositoryImpl({
    required SearchRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;
  final SearchRemoteDataSource _remoteDataSource;

  @override
  Future<List<SearchCardModel>> getListOfSearchCards(String query) {
    try {
      return _remoteDataSource.getListOfSearchCards(query);
    } catch (e) {
      rethrow;
    }
  }
}
