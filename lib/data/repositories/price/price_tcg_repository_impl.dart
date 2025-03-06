import 'package:mtg_helper/data/datasources/price/tcg_remote_data_source.dart';
import 'package:mtg_helper/data/models/scryfall_card_model.dart';
import 'package:mtg_helper/domain/repositories/price/price_tcg_repository.dart';

class PriceTCGRepositoryImpl implements PriceTCGRepository {
  PriceTCGRepositoryImpl({
    required TCGRemoteDataSource tcgRemoteDataSource,
  }) : _tcgRemoteDataSource = tcgRemoteDataSource;

  final TCGRemoteDataSource _tcgRemoteDataSource;

  @override
  Future<List<ScryfallCardModel>> getTCGPrice(String query) {
    try {
      return _tcgRemoteDataSource.getTCG(query);
    } catch (e) {
      rethrow;
    }
  }
}
