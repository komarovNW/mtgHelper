extension FoilChecker on String {
  bool containsFoil() {
    final RegExp regex = RegExp(r'\b(foil|фойл|фоил)\b', caseSensitive: false);
    return regex.hasMatch(this);
  }
}
