import 'package:mtg_helper/data/models/search_card_model.dart';

abstract class SearchRepository {
  Future<List<SearchCardModel>> getListOfSearchCards(String query);
}
