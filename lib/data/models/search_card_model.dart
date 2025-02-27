class SearchCardModel {
  SearchCardModel({
    required this.name,
    required this.scryfallId,
    required this.text,
    this.localizedName,
  });

  factory SearchCardModel.fromJson(Map<String, dynamic> json) {
    return SearchCardModel(
      name: json['name'],
      scryfallId: json['scryfallId'],
      text: json['text'],
      localizedName: json['localizedName'],
    );
  }
  final String name;
  final String scryfallId;
  final String text;
  final String? localizedName;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'scryfallId': scryfallId,
      'text': text,
      if (localizedName != null) 'localizedName': localizedName,
    };
  }
}
