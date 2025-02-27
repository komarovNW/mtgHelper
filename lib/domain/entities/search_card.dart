import 'package:mtg_helper/data/models/search_card_model.dart';

class SearchCardEntity {
  SearchCardEntity({required this.cards});

  factory SearchCardEntity.fromJson(Map<String, dynamic> json) {
    return SearchCardEntity(
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
