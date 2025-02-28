import 'package:mtg_helper/domain/entities/auction.dart';

class AuctionModel extends Auction {
  const AuctionModel({
    required super.id,
    required super.dateEstimated,
    required super.lot,
    required super.currentBid,
    required super.bidAmount,
    required super.shippingInfoQuick,
    required super.shippingInfo,
    required super.datePublished,
    required SellerModel super.seller,
    required super.imageUrl,
  });

  factory AuctionModel.fromJson(Map<String, dynamic> json) {
    return AuctionModel(
      id: json['id'] ?? '',
      dateEstimated: DateTime.fromMillisecondsSinceEpoch(
        int.parse(json['date_estimated']) * 1000,
      ),
      lot: json['lot'] ?? '',
      currentBid: double.tryParse(json['current_bid'] ?? '0') ?? 0,
      bidAmount: int.tryParse(json['bid_amount'] ?? '0') ?? 0,
      shippingInfoQuick: json['shipping_info_quick'] ?? '',
      shippingInfo: json['shipping_info'] ?? '',
      datePublished: DateTime.fromMillisecondsSinceEpoch(
        int.parse(json['date_published']) * 1000,
      ),
      seller: SellerModel.fromJson(Map<String, dynamic>.from(json['seller'])),
      imageUrl: json['image_url'] ?? '',
    );
  }
}

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
