import 'package:flutter/widgets.dart';
import 'package:mtg_helper/res/localizations/app_localizations.dart';

extension LocalizationContext on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
