class Auction {
  const Auction({
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
  final String id;
  final DateTime dateEstimated;
  final String lot;
  final int currentBid;
  final int bidAmount;
  final String shippingInfoQuick;
  final String shippingInfo;
  final DateTime datePublished;
  final Seller seller;
  final String imageUrl;
}

class Seller {
  const Seller({
    required this.id,
    required this.name,
    required this.city,
    required this.refs,
  });
  final String id;
  final String name;
  final String city;
  final String refs;
}
