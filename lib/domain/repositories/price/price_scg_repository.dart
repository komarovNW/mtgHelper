import 'package:mtg_helper/data/models/scg_card_model.dart';

abstract class PriceSCGRepository {
  Future<List<ScgCardsModel>> getSCGPrice(String query);
}
