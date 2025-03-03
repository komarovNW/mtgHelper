import 'package:mtg_helper/data/models/scryfall_card_model.dart';

abstract class PriceTCGRepository {
  Future<List<ScryfallCardModel>> getTCGPrice(String query);
}
