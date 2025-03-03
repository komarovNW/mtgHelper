import 'package:mtg_helper/data/models/singles_card_model.dart';

abstract class PriceSinglesRepository {
  Future<List<SinglesCardModel>> getSinglesPrice(
    String name,
    String? localizationName,
  );
}
