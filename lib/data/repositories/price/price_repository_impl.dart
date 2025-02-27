import 'package:mtg_helper/data/datasources/price/price_remote_data_source.dart';
import 'package:mtg_helper/data/models/search_card_model.dart';
import 'package:mtg_helper/domain/repositories/price/price_repository.dart';

class PriceRepositoryImpl implements PriceRepository {
  PriceRepositoryImpl({
    required PriceRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;
  final PriceRemoteDataSource _remoteDataSource;

  @override
  Future<List<SearchCardModel>> getPrice(String query) {
    return _remoteDataSource.getPrice(query);
  }
}
