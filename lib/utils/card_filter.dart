// List<T> filterCardsByPartialMatch<T>({
//   required List<T> allCards,
//   required String name,
//   String? localizationName,
//   required String Function(T card) modelKey,
// }) {
//   return allCards.where((T card) {
//     final bool matchesName =
//         modelKey(card).toLowerCase().contains(name.toLowerCase());
//     final bool matchesLocalizationName = localizationName != null
//         ? modelKey(card).toLowerCase().contains(localizationName.toLowerCase())
//         : true;
//     return matchesName || matchesLocalizationName;
//   }).toList();
// }

List<T> filterCardsByPartialMatch<T>({
  required List<T> allCards,
  required String name,
  String? localizationName,
  required String Function(T card) modelKey,
}) {
  return allCards.where((T card) {
    final String key = modelKey(card).toLowerCase();
    final String searchName = name.toLowerCase();
    final bool matchesName = key.contains(searchName);

    if (localizationName != null) {
      final String searchLocalization = localizationName.toLowerCase();
      return matchesName || key.contains(searchLocalization);
    }

    return matchesName;
  }).toList();
}

List<T> filterCardsByExactMatch<T>({
  required List<T> allCards,
  required String name,
  String? localizationName,
  required String Function(T card) modelKey,
}) {
  return allCards.where((T card) {
    final bool matchesName = modelKey(card).toLowerCase() == name.toLowerCase();
    final bool matchesLocalizationName = localizationName != null
        ? modelKey(card).toLowerCase() == localizationName.toLowerCase()
        : true;

    return matchesName && matchesLocalizationName;
  }).toList();
}

List<T> filterCardsByExactOrLocalizedMatch<T>({
  required List<T> allCards,
  required String name,
  String? localizationName,
  required String Function(T card) modelKey,
}) {
  return allCards.where((T card) {
    final bool matchesName = modelKey(card).toLowerCase() == name.toLowerCase();
    final bool matchesLocalizationName = localizationName != null
        ? modelKey(card).toLowerCase() == localizationName.toLowerCase()
        : true;

    return matchesName || matchesLocalizationName;
  }).toList();
}
