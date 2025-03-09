class ScgCardsResponse {
  ScgCardsResponse({required this.cards});

  factory ScgCardsResponse.fromJson(Map<String, dynamic> json) {
    return ScgCardsResponse(
      cards: (json['Results'] as List<dynamic>)
          .map((dynamic e) => ScgCardsModel.fromJson(e))
          .toList(),
    );
  }

  final List<ScgCardsModel> cards;
}

class ScgCardsModel {
  ScgCardsModel({required this.card});

  factory ScgCardsModel.fromJson(Map<String, dynamic> json) {
    return ScgCardsModel(
      card: ScgCardModel.fromJson(json['Document']),
    );
  }

  final ScgCardModel card;
}

class ScgCardModel {
  factory ScgCardModel.fromJson(Map<String, dynamic> json) {
    return ScgCardModel(
      imageUrl: _extractStringOrList(json['image']),
      setName: _extractStringOrList(json['set']) as String,
      attributes: (json['hawk_child_attributes'] as List<dynamic>)
          .map((dynamic e) => ScgCardAttributes.fromJson(e))
          .toList(),
    );
  }

  ScgCardModel({
    this.imageUrl,
    required this.setName,
    required this.attributes,
  });

  final String? imageUrl;
  final String setName;
  final List<ScgCardAttributes> attributes;
}

class ScgCard {
  ScgCard({
    this.imageUrl,
    required this.attributes,
    required this.setName,
  });

  final String? imageUrl;
  final ScgCardAttributes attributes;
  final String setName;
}

class ScgCardAttributes {
  ScgCardAttributes({
    required this.price,
    required this.quantity,
    required this.isOnSale,
    required this.priceSale,
  });

  factory ScgCardAttributes.fromJson(Map<String, dynamic> json) {
    return ScgCardAttributes(
      price: _extractStringOrList(json['price']) as String,
      quantity: _extractIntOrList(json['qty']),
      isOnSale: _extractStringOrList(json['is_on_sale']) as String,
      priceSale: _extractStringOrList(json['price_sale']) as String,
    );
  }

  final String price;
  final int quantity;
  final String isOnSale;
  final String priceSale;
}

dynamic _extractStringOrList(dynamic data) {
  if (data is List && data.length == 1) {
    return data.first;
  }
  return data;
}

int _extractIntOrList(dynamic data) {
  if (data is List && data.length == 1) {
    return data.first as int;
  }
  throw ArgumentError('Ожидался список с одним int');
}
