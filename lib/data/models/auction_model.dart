import 'package:mtg_helper/utils/loggable_model.dart';

class AuctionModel extends LoggableModel {
  AuctionModel({
    required this.id,
    required this.dateEstimated,
    required this.lot,
    required this.currentBid,
    required this.bidAmount,
    required this.shippingInfoQuick,
    required this.shippingInfo,
    required this.datePublished,
    required this.seller,
    required this.imageUrl,
  });

  factory AuctionModel.fromJson(Map<String, dynamic> json) {
    try {
      return AuctionModel(
        id: json['id']?.toString() ?? 'unknown_id',
        dateEstimated: _parseDate(json['date_estimated']),
        lot: json['lot']?.toString() ?? 'Unknown lot',
        currentBid: int.tryParse(json['current_bid']?.toString() ?? '') ?? 0,
        bidAmount: int.tryParse(json['bid_amount']?.toString() ?? '') ?? 0,
        shippingInfoQuick: json['shipping_info_quick']?.toString() ?? 'N/A',
        shippingInfo: json['shipping_info']?.toString() ?? 'N/A',
        datePublished: _parseDate(json['date_published']),
        seller: json['seller'] is Map<String, dynamic>
            ? SellerModel.fromJson(json['seller'])
            : SellerModel(
                id: 'unknown',
                name: 'Unknown seller',
                city: '',
                refs: '0',
              ),
        imageUrl: json['image_url']?.toString() ?? '',
      );
    } catch (e, stackTrace) {
      LoggableModel.logError('AuctionModel', json, e, stackTrace);
      return AuctionModel(
        id: 'error',
        dateEstimated: DateTime.fromMillisecondsSinceEpoch(0),
        lot: 'Parsing Error',
        currentBid: 0,
        bidAmount: 0,
        shippingInfoQuick: 'N/A',
        shippingInfo: 'N/A',
        datePublished: DateTime.fromMillisecondsSinceEpoch(0),
        seller: SellerModel(id: 'error', name: 'Error', city: '', refs: '0'),
        imageUrl: '',
      );
    }
  }

  final String id;
  final DateTime dateEstimated;
  final String lot;
  final int currentBid;
  final int bidAmount;
  final String shippingInfoQuick;
  final String shippingInfo;
  final DateTime datePublished;
  final SellerModel seller;
  final String imageUrl;

  static DateTime _parseDate(dynamic timestamp) {
    if (timestamp == null) return DateTime.fromMillisecondsSinceEpoch(0);
    return DateTime.fromMillisecondsSinceEpoch(
      int.tryParse(timestamp.toString()) ?? 0 * 1000,
    );
  }
}

class SellerModel extends LoggableModel {
  SellerModel({
    required this.id,
    required this.name,
    required this.city,
    required this.refs,
  });

  factory SellerModel.fromJson(Map<String, dynamic> json) {
    try {
      return SellerModel(
        id: json['id']?.toString() ?? 'unknown',
        name: json['name']?.toString() ?? 'Unknown seller',
        city: json['city']?.toString() ?? '',
        refs: json['refs']?.toString() ?? '0',
      );
    } catch (e, stackTrace) {
      LoggableModel.logError('SellerModel', json, e, stackTrace);
      return SellerModel(id: 'error', name: 'Error', city: '', refs: '0');
    }
  }

  final String id;
  final String name;
  final String city;
  final String refs;
}
