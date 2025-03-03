import 'dart:convert';

class SinglesCardModel {
  SinglesCardModel({
    required this.url,
    required this.line,
    required this.cost,
    required this.name,
    required this.source,
    required this.qty,
    required this.seller,
    // required this.stamp,
    this.city,
  });

  factory SinglesCardModel.fromJson(Map<String, dynamic> json) {
    return SinglesCardModel(
      url: json['url'] ?? '',
      line: json['line'] ?? '',
      cost: json['cost'] ?? 0,
      name: json['name'] ?? '',
      source: json['source'] ?? '',
      qty: json['qty'] ?? 0,
      seller: Seller.fromJson(json['seller']),
      // stamp: json['stamp'] ?? '',
      city: json['city'],
    );
  }
  final String url;
  final String line;
  final int cost;
  final String name;
  final String source;
  final int qty;
  final Seller seller;
  // final String stamp;
  final String? city;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'url': url,
        'line': line,
        'cost': cost,
        'name': name,
        'source': source,
        'qty': qty,
        'seller': seller.toJson(),
        // 'stamp': stamp,
        'city': city,
      };
}

class Seller {
  Seller({
    // required this.id,
    required this.name,
    required this.city,
    required this.refs,
  });

  factory Seller.fromJson(dynamic json) {
    if (json is String) {
      return Seller(
        // id: '',
        name: json,
        city: '',
        refs: '',
      );
    } else {
      return Seller(
        // id: json['id'] ?? '',
        name: json['name'] ?? '',
        city: json['city'] ?? '',
        refs: json['refs'] ?? '',
      );
    }
  }
  // final String id;
  final String name;
  final String city;
  final String refs;

  Map<String, dynamic> toJson() => <String, dynamic>{
        // 'id': id,
        'name': name,
        'city': city,
        'refs': refs,
      };
}

List<SinglesCardModel> parseListings(String jsonStr) {
  final List<dynamic> jsonData = json.decode(jsonStr);
  return jsonData
      .map((dynamic json) => SinglesCardModel.fromJson(json))
      .toList();
}
