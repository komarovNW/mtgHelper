import 'package:mtg_helper/data/models/search_card_model.dart';

extension SearchCardImage on SearchCardModel {
  String get imageUrl =>
      'https://api.scryfall.com/cards/$scryfallId?format=image&version=normal';
}
