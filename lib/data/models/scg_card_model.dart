import 'dart:developer';

class ScgCardsResponse {
  ScgCardsResponse({required this.cards});

  factory ScgCardsResponse.fromJson(Map<String, dynamic> json) {
    try {
      return ScgCardsResponse(
        cards: (json['Results'] as List<dynamic>?)
                ?.map((dynamic e) => ScgCardsModel.fromJson(e))
                .toList() ??
            <ScgCardsModel>[],
      );
    } catch (e, stackTrace) {
      log(
        'Ошибка при разборе ScgCardsResponse: $e, json: $json',
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  final List<ScgCardsModel> cards;
}

class ScgCardsModel {
  ScgCardsModel({required this.card});

  factory ScgCardsModel.fromJson(Map<String, dynamic> json) {
    try {
      final dynamic document = json['Document'];
      if (document == null) {
        throw ArgumentError('Поле "Document" отсутствует или равно null');
      }
      return ScgCardsModel(
        card: ScgCardModel.fromJson(document),
      );
    } catch (e, stackTrace) {
      log(
        'Ошибка при разборе ScgCardsModel: $e, json: $json',
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  final ScgCardModel card;
}

class ScgCardModel {
  factory ScgCardModel.fromJson(Map<String, dynamic> json) {
    try {
      return ScgCardModel(
        imageUrl: _extractStringOrList(json['image']),
        cardName: _extractStringOrList(json['card_name']) ?? 'Unknown Card',
        setName: _extractStringOrList(json['set']) as String? ?? 'Unknown Set',
        attributes: (json['hawk_child_attributes'] as List<dynamic>?)
                ?.map((dynamic e) => ScgCardAttributes.fromJson(e))
                .toList() ??
            <ScgCardAttributes>[],
      );
    } catch (e, stackTrace) {
      log(
        'Ошибка при разборе ScgCardModel: $e, json: $json',
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  ScgCardModel({
    this.imageUrl,
    required this.setName,
    required this.cardName,
    required this.attributes,
  });

  final String? imageUrl;
  final String setName;
  final String cardName;
  final List<ScgCardAttributes> attributes;
}

class ScgCardAttributes {
  ScgCardAttributes({
    required this.price,
    required this.quantity,
    required this.isOnSale,
    required this.priceSale,
  });

  factory ScgCardAttributes.fromJson(Map<String, dynamic> json) {
    try {
      return ScgCardAttributes(
        price: _extractStringOrList(json['price']) as String? ?? '0.00',
        quantity: _extractIntOrList(json['qty']),
        isOnSale:
            _extractStringOrList(json['is_on_sale']) as String? ?? 'false',
        priceSale:
            _extractStringOrList(json['price_sale']) as String? ?? '0.00',
      );
    } catch (e, stackTrace) {
      log(
        'Ошибка при разборе ScgCardAttributes: $e, json: $json',
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  final String price;
  final int quantity;
  final String isOnSale;
  final String priceSale;
}

dynamic _extractStringOrList(dynamic data) {
  if (data is List && data.isNotEmpty) {
    return data.first;
  }
  return data;
}

int _extractIntOrList(dynamic data) {
  if (data is List && data.isNotEmpty) {
    return data.first as int? ?? 0;
  }
  return data as int? ?? 0;
}
