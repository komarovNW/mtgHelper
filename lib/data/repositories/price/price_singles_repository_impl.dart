import 'package:mtg_helper/data/datasources/price/singles_remote_data_source.dart';
import 'package:mtg_helper/data/models/singles_card_model.dart';
import 'package:mtg_helper/domain/repositories/price/price_singles_repository.dart';

class PriceSinglesRepositoryImpl implements PriceSinglesRepository {
  PriceSinglesRepositoryImpl({
    required SinglesRemoteDataSource singlesRemoteDataSource,
  }) : _singlesRemoteDataSource = singlesRemoteDataSource;

  final SinglesRemoteDataSource _singlesRemoteDataSource;

  @override
  Future<List<SinglesCardModel>> getSinglesPrice(
    String name,
    String? localizationName,
  ) {
    return _singlesRemoteDataSource.getSingles(name, localizationName);
  }
}
