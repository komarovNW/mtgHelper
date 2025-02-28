extension InitialsExtansion on String {
  String get initials {
    final String trimmed = trim();
    if (trimmed.isEmpty) return '';

    final List<String> parts = trimmed.split(RegExp(r'\s+'));

    if (parts.length == 1) {
      return parts[0].isNotEmpty ? parts[0][0].toUpperCase() : '';
    } else {
      return '${parts[0][0].toUpperCase()}${parts[1][0].toUpperCase()}';
    }
  }
}
