import 'package:flutter/material.dart';
import 'package:mtg_helper/extension/localization_extension.dart';
import 'package:mtg_helper/utils/enums/format.dart';

class FormatDropdown extends StatelessWidget {
  const FormatDropdown({
    super.key,
    required this.selectedFormat,
    required this.onFormatSelected,
  });

  final Format selectedFormat;
  final ValueChanged<Format> onFormatSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
            ),
            child: Text(
              context.l10n.matchFormat,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          DropdownButtonFormField<Format>(
            value: selectedFormat,
            items: Format.values.map((Format format) {
              return DropdownMenuItem<Format>(
                value: format,
                child: Text(format.name),
              );
            }).toList(),
            onChanged: (Format? newValue) {
              if (newValue != null) onFormatSelected(newValue);
            },
          ),
        ],
      ),
    );
  }
}
