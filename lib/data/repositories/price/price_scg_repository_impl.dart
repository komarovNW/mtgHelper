import 'package:mtg_helper/data/datasources/price/scg_remote_data_source.dart';
import 'package:mtg_helper/data/models/scg_card_model.dart';

import 'package:mtg_helper/domain/repositories/price/price_scg_repository.dart';

class PriceSCGRepositoryImpl implements PriceSCGRepository {
  PriceSCGRepositoryImpl({
    required SCGRemoteDataSource scgRemoteDataSource,
  }) : _scgRemoteDataSource = scgRemoteDataSource;

  final SCGRemoteDataSource _scgRemoteDataSource;

  @override
  Future<List<ScgCardsModel>> getSCGPrice(String query) async {
    /// TODO почесу то не приходит сам silence проверить почему
    return await _scgRemoteDataSource.getSCG(query);
    // final List<ScgCardsModel> allCards = await _scgRemoteDataSource.getSCG(query);
    // return filterCardsByExactMatch(
    //   allCards: allCards,
    //   name: query,
    //   modelKey: (ScgCardsModel card) => card.card.cardName,
    // );
  }
}
