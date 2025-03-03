class SCGDataModel {
  SCGDataModel({
    required this.condition,
    required this.price,
    required this.stock,
    required this.purchasingDisabled,
    required this.language,
  });

  factory SCGDataModel.fromJson(Map<String, dynamic> json) {
    return SCGDataModel(
      condition: json['condition'],
      price: (json['price'] as num).toDouble(),
      stock: json['stock'],
      purchasingDisabled: json['purchasing_disabled'],
      language: json['language'],
    );
  }
  final String condition;
  final double price;
  final int stock;
  final bool purchasingDisabled;
  final String language;
}

class SCGCardModel {
  SCGCardModel({
    required this.id,
    required this.name,
    required this.set,
    required this.url,
    required this.cards,
  });

  factory SCGCardModel.fromJson(Map<String, dynamic> json) {
    return SCGCardModel(
      id: json['id'],
      name: json['name'],
      set: json['set'],
      url: json['url'],
      cards: (json['cards'] as List<dynamic>)
          .map((dynamic card) => SCGDataModel.fromJson(card))
          .toList(),
    );
  }
  final int id;
  final String name;
  final String set;
  final String url;
  final List<SCGDataModel> cards;
}

class SCGDataModelResponse {
  SCGDataModelResponse({
    required this.rows,
    required this.page,
    required this.pageCount,
  });

  factory SCGDataModelResponse.fromJson(Map<String, dynamic> json) {
    return SCGDataModelResponse(
      rows: (json['rows'] as List<dynamic>)
          .map((dynamic row) => SCGCardModel.fromJson(row))
          .toList(),
      page: json['page'],
      pageCount: json['pageCount'],
    );
  }
  final List<SCGCardModel> rows;
  final int page;
  final int pageCount;
}
