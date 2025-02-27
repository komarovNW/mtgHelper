import 'package:mtg_helper/data/models/search_card_model.dart';

abstract class PriceRepository {
  Future<List<SearchCardModel>> getPrice(String query);
}
