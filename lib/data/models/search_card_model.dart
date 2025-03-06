import 'package:mtg_helper/utils/loggable_model.dart';

class SearchCardModel extends LoggableModel {
  SearchCardModel({
    required this.name,
    required this.scryfallId,
    required this.text,
    this.localizedName,
  });

  factory SearchCardModel.fromJson(Map<String, dynamic> json) {
    try {
      return SearchCardModel(
        name: json['name'] ?? '',
        scryfallId: json['scryfallId'] ?? '',
        text: json['text'] ?? '',
        localizedName: json['localizedName'],
      );
    } catch (error, stackTrace) {
      LoggableModel.logError('SearchCardModel', json, error, stackTrace);
      return SearchCardModel(
        name: '',
        scryfallId: '',
        text: '',
      );
    }
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
