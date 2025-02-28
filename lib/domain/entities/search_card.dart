import 'package:mtg_helper/data/models/search_card_model.dart';

class SearchCard {
  SearchCard({required this.cards});

  factory SearchCard.fromJson(Map<String, dynamic> json) {
    return SearchCard(
      cards: json.values
          .map((dynamic card) => SearchCardModel.fromJson(card))
          .toList(),
    );
  }
  final List<SearchCardModel> cards;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      for (int i = 0; i < cards.length; i++) '${i + 1}': cards[i].toJson(),
    };
  }
}
