import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart' as dom;

extension CleanLineExtension on String {
  String cleanLine() {
    // Преобразуем строку в HTML-структуру
    final dom.Document document = parse(this);

    // Извлекаем чистый текст без тегов
    String cleanText = document.body?.text.trim() ?? '';

    // Убираем лишние пробелы и спецсимволы
    cleanText = cleanText.replaceAll(RegExp(r'\s+'), ' ');

    return cleanText;
  }
}
