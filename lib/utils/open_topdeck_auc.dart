import 'package:flutter/material.dart';
import 'package:mtg_helper/extension/localization_extension.dart';
import 'package:mtg_helper/utils/api_constants.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> showConfirmAuctionDialog({
  required BuildContext context,
  required String itemId,
}) async {
  final bool? confirmed = await showDialog<bool>(
    context: context,
    builder: (BuildContext dialogContext) => ConfirmAuctionDialog(
      onConfirm: () => Navigator.of(dialogContext).pop(true),
      onCancel: () => Navigator.of(dialogContext).pop(false),
    ),
  );

  if (confirmed == true) {
    final Uri url = Uri.parse('${ApiConstants.topdeckCurrentAuction}$itemId');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Не удалось открыть ссылку $url';
    }
  }
}

class ConfirmAuctionDialog extends StatelessWidget {
  const ConfirmAuctionDialog({
    super.key,
    required this.onConfirm,
    required this.onCancel,
  });

  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(context.l10n.auctionCardDialogConfirmation),
      content: Text(context.l10n.auctionCardDialogGoToSelectedAuc),
      actions: <Widget>[
        TextButton(
          onPressed: onCancel,
          child: Text(context.l10n.no),
        ),
        TextButton(
          onPressed: onConfirm,
          child: Text(context.l10n.yes),
        ),
      ],
    );
  }
}
