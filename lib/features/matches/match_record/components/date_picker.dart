import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mtg_helper/extension/localization_extension.dart';

class DatePicker extends StatelessWidget {
  const DatePicker({
    super.key,
    required this.selectedDate,
    required this.onTap,
  });
  final DateTime selectedDate;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      child: ListTile(
        trailing: const Icon(Icons.calendar_today),
        onTap: onTap,
        contentPadding: EdgeInsets.zero,
        title: Text(
          context.l10n
              .matchRecord(DateFormat('dd.MM.yyyy').format(selectedDate)),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
