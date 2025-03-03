class ScryfallDataModel {
  ScryfallDataModel({
    required this.object,
    required this.totalCards,
    required this.hasMore,
    required this.data,
  });

  factory ScryfallDataModel.fromJson(Map<String, dynamic> json) {
    return ScryfallDataModel(
      object: json['object'],
      totalCards: json['total_cards'],
      hasMore: json['has_more'],
      data: List<ScryfallCardModel>.from(
        json['data'].map((dynamic item) => ScryfallCardModel.fromJson(item)),
      ),
    );
  }
  final String object;
  final int totalCards;
  final bool hasMore;
  final List<ScryfallCardModel> data;
}

class ScryfallCardModel {
  // final String rarity;
  // final String flavorText;
  // final String cardBackId;
  // final String artist;
  // final List<String> artistIds;
  // final String illustrationId;
  // final String borderColor;
  // final String frame;
  // final bool fullArt;
  // final bool textless;
  // final bool booster;
  // final bool storySpotlight;
  // final int edhrecRank;
  // final RelatedUris relatedUris;
  // final PurchaseUris purchaseUris;

  ScryfallCardModel({
    required this.name,
    required this.setName,
    required this.prices,
    required this.imageUris,
    // required this.id,
    // required this.lang,
    // required this.releasedAt,
    // required this.uri,
    // required this.scryfallUri,
    // required this.layout,
    // required this.highresImage,
    // required this.imageStatus,
    // required this.manaCost,
    // required this.cmc,
    // required this.typeLine,
    // required this.oracleText,
    // required this.colors,
    // required this.colorIdentity,
    // required this.keywords,
    // required this.allParts,
    // required this.legalities,
    // required this.games,
    // required this.reserved,
    // required this.gameChanger,
    // required this.foil,
    // required this.nonfoil,
    // required this.finishes,
    // required this.oversized,
    // required this.promo,
    // required this.reprint,
    // required this.variation,
    // required this.setId,
    // required this.set,
    // required this.setType,
    // required this.setUri,
    // required this.setSearchUri,
    // required this.scryfallSetUri,
    // required this.rulingsUri,
    // required this.printsSearchUri,
    // required this.collectorNumber,
    required this.digital,
    // required this.rarity,
    // required this.flavorText,
    // required this.cardBackId,
    // required this.artist,
    // required this.artistIds,
    // required this.illustrationId,
    // required this.borderColor,
    // required this.frame,
    // required this.fullArt,
    // required this.textless,
    // required this.booster,
    // required this.storySpotlight,
    // required this.edhrecRank,
    // required this.relatedUris,
    // required this.purchaseUris,
  });

  factory ScryfallCardModel.fromJson(Map<String, dynamic> json) {
    return ScryfallCardModel(
      name: json['name'] ?? '',
      setName: json['set_name'] ?? '',
      prices: Prices.fromJson(json['prices']),
      imageUris: ImageUris.fromJson(json['image_uris']),
      // id: json['id'] ?? '',
      // lang: json['lang'] ?? '',
      // releasedAt: json['released_at'] ?? '',
      // uri: json['uri'] ?? '',
      // scryfallUri: json['scryfall_uri'] ?? '',
      // layout: json['layout'] ?? '',
      // highresImage: json['highres_image'] ?? false,
      // imageStatus: json['image_status'] ?? '',
      // manaCost: json['mana_cost'] ?? '',
      // cmc: _parseInt(json['cmc']),
      // typeLine: json['type_line'] ?? '',
      // oracleText: json['oracle_text'] ?? '',
      // colors: List<String>.from(json['colors'] ?? []),
      // colorIdentity: List<String>.from(json['color_identity'] ?? []),
      // keywords: List<String>.from(json['keywords'] ?? []),
      // allParts: (json['all_parts'] as List<dynamic>?)?.map((item) => RelatedCard.fromJson(item)).toList() ?? [],
      // legalities: Map<String, String>.from(json['legalities'] ?? {}),
      // games: List<String>.from(json['games'] ?? []),
      // reserved: json['reserved'] ?? false,
      // gameChanger: json['game_changer'] ?? false,
      // foil: json['foil'] ?? false,
      // nonfoil: json['nonfoil'] ?? false,
      // finishes: List<String>.from(json['finishes'] ?? []),
      // oversized: json['oversized'] ?? false,
      // promo: json['promo'] ?? false,
      // reprint: json['reprint'] ?? false,
      // variation: json['variation'] ?? false,
      // setId: json['set_id'] ?? '',
      // set: json['set'] ?? '',
      // setType: json['set_type'] ?? '',
      // setUri: json['set_uri'] ?? '',
      // setSearchUri: json['set_search_uri'] ?? '',
      // scryfallSetUri: json['scryfall_set_uri'] ?? '',
      // rulingsUri: json['rulings_uri'] ?? '',
      // printsSearchUri: json['prints_search_uri'] ?? '',
      // collectorNumber: json['collector_number'] ?? '',
      digital: json['digital'] ?? false,
      // rarity: json['rarity'] ?? '',
      // flavorText: json['flavor_text'] ?? '',
      // cardBackId: json['card_back_id'] ?? '',
      // artist: json['artist'] ?? '',
      // artistIds: List<String>.from(json['artist_ids'] ?? []),
      // illustrationId: json['illustration_id'] ?? '',
      // borderColor: json['border_color'] ?? '',
      // frame: json['frame'] ?? '',
      // fullArt: json['full_art'] ?? false,
      // textless: json['textless'] ?? false,
      // booster: json['booster'] ?? false,
      // storySpotlight: json['story_spotlight'] ?? false,
      // edhrecRank: json['edhrec_rank'] ?? 0,
      // relatedUris: RelatedUris.fromJson(json['related_uris'] ?? {}),
      // purchaseUris: PurchaseUris.fromJson(json['purchase_uris'] ?? {}),
    );
  }
  // final String id;
  // final String lang;
  // final String releasedAt;
  // final String uri;
  // final String scryfallUri;
  // final String layout;
  // final bool highresImage;
  // final String imageStatus;
  // final String manaCost;
  // final int cmc;
  // final String typeLine;
  // final String oracleText;
  // final List<String> colors;
  // final List<String> colorIdentity;
  // final List<String> keywords;
  // final List<RelatedCard> allParts;
  // final Map<String, String> legalities;
  // final List<String> games;
  // final bool reserved;
  // final bool gameChanger;
  // final bool foil;
  // final bool nonfoil;
  // final List<String> finishes;
  // final bool oversized;
  // final bool promo;
  // final bool reprint;
  // final bool variation;
  // final String setId;
  // final String set;
  // final String setType;
  // final String setUri;
  // final String setSearchUri;
  // final String scryfallSetUri;
  // final String rulingsUri;
  // final String printsSearchUri;
  // final String collectorNumber;
  final bool digital;
  final ImageUris imageUris;
  final Prices prices;
  final String setName;
  final String name;
}

// class RelatedCard {
//   final String id;
//   final String name;
//   final String typeLine;
//   final String uri;
//
//   RelatedCard({
//     required this.id,
//     required this.name,
//     required this.typeLine,
//     required this.uri,
//   });
//
//   factory RelatedCard.fromJson(Map<String, dynamic> json) {
//     return RelatedCard(
//       id: json['id'] ?? '',
//       name: json['name'] ?? '',
//       typeLine: json['type_line'] ?? '',
//       uri: json['uri'] ?? '',
//     );
//   }
// }

class Prices {
  Prices({
    required this.usd,
    required this.usdFoil,
    required this.usdEtched,
    required this.eur,
    required this.eurFoil,
    required this.tix,
  });

  factory Prices.fromJson(Map<String, dynamic> json) {
    return Prices(
      usd: json['usd'] ?? '',
      usdFoil: json['usd_foil'] ?? '',
      usdEtched: json['usd_etched'] ?? '',
      eur: json['eur'] ?? '',
      eurFoil: json['eur_foil'] ?? '',
      tix: json['tix'] ?? '',
    );
  }
  final String usd;
  final String usdFoil;
  final String usdEtched;
  final String eur;
  final String eurFoil;
  final String tix;
}

// class RelatedUris {
//   final String gatherer;
//   final String tcgplayerInfiniteArticles;
//   final String tcgplayerInfiniteDecks;
//   final String edhrec;
//
//   RelatedUris({
//     required this.gatherer,
//     required this.tcgplayerInfiniteArticles,
//     required this.tcgplayerInfiniteDecks,
//     required this.edhrec,
//   });
//
//   factory RelatedUris.fromJson(Map<String, dynamic> json) {
//     return RelatedUris(
//       gatherer: json['gatherer'] ?? '',
//       tcgplayerInfiniteArticles: json['tcgplayer_infinite_articles'] ?? '',
//       tcgplayerInfiniteDecks: json['tcgplayer_infinite_decks'] ?? '',
//       edhrec: json['edhrec'] ?? '',
//     );
//   }
// }

class PurchaseUris {
  PurchaseUris({
    required this.tcgplayer,
    required this.cardmarket,
    required this.cardhoarder,
  });

  factory PurchaseUris.fromJson(Map<String, dynamic> json) {
    return PurchaseUris(
      tcgplayer: json['tcgplayer'] ?? '',
      cardmarket: json['cardmarket'] ?? '',
      cardhoarder: json['cardhoarder'] ?? '',
    );
  }
  final String tcgplayer;
  final String cardmarket;
  final String cardhoarder;
}

class ImageUris {
  ImageUris({
    required this.small,
    required this.normal,
    required this.large,
    required this.png,
    required this.artCrop,
    required this.borderCrop,
  });

  factory ImageUris.fromJson(Map<String, dynamic> json) {
    return ImageUris(
      small: json['small'] ?? '',
      normal: json['normal'] ?? '',
      large: json['large'] ?? '',
      png: json['png'] ?? '',
      artCrop: json['art_crop'] ?? '',
      borderCrop: json['border_crop'] ?? '',
    );
  }
  final String small;
  final String normal;
  final String large;
  final String png;
  final String artCrop;
  final String borderCrop;
}
