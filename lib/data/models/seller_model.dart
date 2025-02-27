import 'package:mtg_helper/domain/entities/auction.dart';

class SellerModel extends Seller {
  const SellerModel({
    required super.id,
    required super.name,
    required super.city,
    required super.refs,
  });

  factory SellerModel.fromJson(Map<String, dynamic> json) {
    return SellerModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      city: json['city'] ?? '',
      refs: json['refs'] ?? '0',
    );
  }
}
