import 'package:flutter/material.dart';
import 'package:mtg_helper/extension/localization_extension.dart';

class Alert extends StatelessWidget {
  const Alert({
    super.key,
    required this.close,
    required this.reset,
  });
  final Function close;
  final Function reset;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      backgroundColor: Colors.white,
      content: Text(
        context.l10n.scoreDialogText,
        style: const TextStyle(fontSize: 16),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            close();
            Navigator.pop(context);
          },
          child: Text(context.l10n.no),
        ),
        TextButton(
          onPressed: () {
            reset();
            Navigator.pop(context);
          },
          child: Text(context.l10n.yes),
        ),
      ],
    );
  }
}
