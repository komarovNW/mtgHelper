import 'dart:convert';

class SCGRequest {
  SCGRequest({
    required this.keyword,
    required this.variant,
    required this.maxPerPage,
    required this.facetSelections,
    required this.clientGuid,
  });

  factory SCGRequest.fromJson(Map<String, dynamic> json) {
    return SCGRequest(
      keyword: json['Keyword'],
      variant: Variant.fromJson(json['Variant']),
      maxPerPage: json['MaxPerPage'],
      facetSelections: FacetSelections.fromJson(json['FacetSelections']),
      clientGuid: json['clientguid'],
    );
  }
  final String keyword;
  final Variant variant;
  final int maxPerPage;
  final FacetSelections facetSelections;
  final String clientGuid;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Keyword': keyword,
      'Variant': variant.toMap(),
      'MaxPerPage': maxPerPage,
      'FacetSelections': facetSelections.toMap(),
      'clientguid': clientGuid,
    };
  }

  String toJson() {
    return jsonEncode(toMap());
  }
}

class Variant {
  Variant({required this.maxPerPage});

  factory Variant.fromJson(Map<String, dynamic> json) {
    return Variant(maxPerPage: json['MaxPerPage']);
  }
  final int maxPerPage;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'MaxPerPage': maxPerPage};
  }

  String toJson() {
    return jsonEncode(toMap());
  }
}

class FacetSelections {
  FacetSelections({required this.cardName});

  factory FacetSelections.fromJson(Map<String, dynamic> json) {
    return FacetSelections(
      cardName: json['card_name'],
    );
  }
  final String cardName;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'card_name': cardName};
  }

  String toJson() {
    return jsonEncode(toMap());
  }
}
