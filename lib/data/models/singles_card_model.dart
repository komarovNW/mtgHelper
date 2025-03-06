import 'dart:convert';
import 'package:mtg_helper/utils/loggable_model.dart';

class SinglesCardModel extends LoggableModel {
  SinglesCardModel({
    required this.url,
    required this.line,
    required this.cost,
    required this.name,
    required this.source,
    required this.qty,
    required this.seller,
    this.city,
  });

  factory SinglesCardModel.fromJson(Map<String, dynamic> json) {
    try {
      return SinglesCardModel(
        url: json['url'] ?? '',
        line: json['line'] ?? '',
        cost: json['cost'] is int
            ? json['cost']
            : int.tryParse(json['cost'].toString()) ?? 0,
        name: json['name'] ?? '',
        source: json['source'] ?? '',
        qty: json['qty'] is int
            ? json['qty']
            : int.tryParse(json['qty'].toString()) ?? 0,
        seller: Seller.fromJson(json['seller']),
        city: json['city'] as String?,
      );
    } catch (e, stackTrace) {
      LoggableModel.logError('SinglesCardModel', json, e, stackTrace);
      return SinglesCardModel(
        url: '',
        line: '',
        cost: 0,
        name: 'Неизвестная карта',
        source: '',
        qty: 0,
        seller: Seller.empty(),
      );
    }
  }

  final String url;
  final String line;
  final int cost;
  final String name;
  final String source;
  final int qty;
  final Seller seller;
  final String? city;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'url': url,
        'line': line,
        'cost': cost,
        'name': name,
        'source': source,
        'qty': qty,
        'seller': seller.toJson(),
        'city': city,
      };
}

class Seller {
  Seller({
    required this.name,
    required this.city,
    required this.refs,
  });

  factory Seller.fromJson(dynamic json) {
    try {
      if (json is String) {
        return Seller(name: json, city: '', refs: '');
      } else if (json is Map<String, dynamic>) {
        return Seller(
          name: json['name'] ?? '',
          city: json['city'] ?? '',
          refs: json['refs'] ?? '',
        );
      }
      throw FormatException('Неизвестный формат seller: $json');
    } catch (e, stackTrace) {
      LoggableModel.logError('Seller', json, e, stackTrace);
      return Seller.empty();
    }
  }

  factory Seller.empty() =>
      Seller(name: 'Неизвестный продавец', city: '', refs: '');

  final String name;
  final String city;
  final String refs;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'city': city,
        'refs': refs,
      };
}

List<SinglesCardModel> parseListings(String jsonStr) {
  try {
    final List<dynamic> jsonData = json.decode(jsonStr);
    return jsonData.map((dynamic json) {
      if (json is Map<String, dynamic>) {
        return SinglesCardModel.fromJson(json);
      } else {
        throw FormatException('Неверный формат JSON элемента: $json');
      }
    }).toList();
  } catch (e, stackTrace) {
    LoggableModel.logError('List<SinglesCardModel>', json, e, stackTrace);
    return <SinglesCardModel>[];
  }
}
