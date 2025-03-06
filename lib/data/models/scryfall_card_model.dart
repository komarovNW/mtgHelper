import 'package:mtg_helper/utils/loggable_model.dart';

class ScryfallDataModel extends LoggableModel {
  ScryfallDataModel({
    required this.object,
    required this.totalCards,
    required this.hasMore,
    required this.data,
  });

  factory ScryfallDataModel.fromJson(Map<String, dynamic> json) {
    try {
      return ScryfallDataModel(
        object: json['object'] ?? '',
        totalCards: json['total_cards'] ?? 0,
        hasMore: json['has_more'] ?? false,
        data: (json['data'] as List<dynamic>?)
                ?.map((dynamic item) => ScryfallCardModel.fromJson(item))
                .toList() ??
            <ScryfallCardModel>[],
      );
    } catch (e, stackTrace) {
      LoggableModel.logError('ScryfallDataModel', json, e, stackTrace);
      return ScryfallDataModel(
        object: '',
        totalCards: 0,
        hasMore: false,
        data: <ScryfallCardModel>[],
      );
    }
  }

  final String object;
  final int totalCards;
  final bool hasMore;
  final List<ScryfallCardModel> data;
}

class ScryfallCardModel extends LoggableModel {
  ScryfallCardModel({
    required this.name,
    required this.setName,
    required this.prices,
    required this.imageUris,
    required this.digital,
  });

  factory ScryfallCardModel.fromJson(Map<String, dynamic> json) {
    try {
      return ScryfallCardModel(
        name: json['name'] ?? '',
        setName: json['set_name'] ?? '',
        prices: Prices.fromJson(json['prices'] ?? <String, dynamic>{}),
        imageUris:
            ImageUris.fromJson(json['image_uris'] ?? <String, dynamic>{}),
        digital: json['digital'] ?? false,
      );
    } catch (e, stackTrace) {
      LoggableModel.logError('ScryfallCardModel', json, e, stackTrace);
      return ScryfallCardModel(
        name: '',
        setName: '',
        prices: Prices.empty(),
        imageUris: ImageUris.empty(),
        digital: false,
      );
    }
  }

  final String name;
  final String setName;
  final Prices prices;
  final ImageUris imageUris;
  final bool digital;
}

class Prices extends LoggableModel {
  Prices({
    required this.usd,
    required this.usdFoil,
    required this.usdEtched,
    required this.eur,
    required this.eurFoil,
    required this.tix,
  });

  factory Prices.fromJson(Map<String, dynamic> json) {
    try {
      return Prices(
        usd: json['usd'] ?? '',
        usdFoil: json['usd_foil'] ?? '',
        usdEtched: json['usd_etched'] ?? '',
        eur: json['eur'] ?? '',
        eurFoil: json['eur_foil'] ?? '',
        tix: json['tix'] ?? '',
      );
    } catch (e, stackTrace) {
      LoggableModel.logError('Prices', json, e, stackTrace);
      return Prices.empty();
    }
  }

  factory Prices.empty() => Prices(
        usd: '',
        usdFoil: '',
        usdEtched: '',
        eur: '',
        eurFoil: '',
        tix: '',
      );

  final String usd;
  final String usdFoil;
  final String usdEtched;
  final String eur;
  final String eurFoil;
  final String tix;
}

class ImageUris extends LoggableModel {
  ImageUris({
    required this.small,
    required this.normal,
    required this.large,
    required this.png,
    required this.artCrop,
    required this.borderCrop,
  });

  factory ImageUris.fromJson(Map<String, dynamic> json) {
    try {
      return ImageUris(
        small: json['small'] ?? '',
        normal: json['normal'] ?? '',
        large: json['large'] ?? '',
        png: json['png'] ?? '',
        artCrop: json['art_crop'] ?? '',
        borderCrop: json['border_crop'] ?? '',
      );
    } catch (e, stackTrace) {
      LoggableModel.logError('ImageUris', json, e, stackTrace);
      return ImageUris.empty();
    }
  }

  factory ImageUris.empty() => ImageUris(
        small: '',
        normal: '',
        large: '',
        png: '',
        artCrop: '',
        borderCrop: '',
      );

  final String small;
  final String normal;
  final String large;
  final String png;
  final String artCrop;
  final String borderCrop;
}

class PurchaseUris extends LoggableModel {
  PurchaseUris({
    required this.tcgplayer,
    required this.cardmarket,
    required this.cardhoarder,
  });

  factory PurchaseUris.fromJson(Map<String, dynamic> json) {
    try {
      return PurchaseUris(
        tcgplayer: json['tcgplayer'] ?? '',
        cardmarket: json['cardmarket'] ?? '',
        cardhoarder: json['cardhoarder'] ?? '',
      );
    } catch (e, stackTrace) {
      LoggableModel.logError('PurchaseUris', json, e, stackTrace);
      return PurchaseUris.empty();
    }
  }

  factory PurchaseUris.empty() => PurchaseUris(
        tcgplayer: '',
        cardmarket: '',
        cardhoarder: '',
      );

  final String tcgplayer;
  final String cardmarket;
  final String cardhoarder;
}
