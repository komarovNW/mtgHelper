import 'package:flutter/material.dart';

enum Format {
  pioneer(formatName: 'Пионер', formatColor: Colors.deepPurple),
  standart(formatName: 'Стандарт', formatColor: Colors.blue),
  modern(formatName: 'Модерн', formatColor: Colors.green),
  legacy(formatName: 'Легаси', formatColor: Colors.red),
  pauper(formatName: 'Паупер', formatColor: Colors.yellow),
  other(formatName: 'Другое', formatColor: Colors.grey);

  const Format({
    required this.formatName,
    required this.formatColor,
  });

  final String formatName;
  final Color formatColor;
}
