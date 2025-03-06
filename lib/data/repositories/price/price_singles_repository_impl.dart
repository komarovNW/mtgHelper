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
  ) async {
    try {
      final List<SinglesCardModel> allCards =
          await _singlesRemoteDataSource.getSingles(name, localizationName);
      final List<SinglesCardModel> filteredCards = allCards
          .where(
            (SinglesCardModel card) =>
                card.name.toLowerCase() == name.toLowerCase(),
          )
          .toList();
      filteredCards.sort(
        (SinglesCardModel a, SinglesCardModel b) => a.cost.compareTo(b.cost),
      );
      return filteredCards;
    } catch (e) {
      rethrow;
    }
  }
}
