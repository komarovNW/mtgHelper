class Request {
  Request({
    required this.keyword,
    required this.variant,
    required this.maxPerPage,
    required this.facetSelections,
    required this.clientGuid,
  });
  final String keyword;
  final Variant variant;
  final int maxPerPage;
  final FacetSelections facetSelections;
  final String clientGuid;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'Keyword': keyword,
      'Variant': variant.toJson(),
      'MaxPerPage': maxPerPage,
      'FacetSelections': facetSelections.toJson(),
      'clientguid': clientGuid,
    };
  }
}

class Variant {
  Variant({required this.max});
  final int max;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'MaxPerPage': max,
    };
  }
}

class FacetSelections {
  FacetSelections({required this.cardName});
  final List<String> cardName;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'card_name': cardName,
    };
  }
}
