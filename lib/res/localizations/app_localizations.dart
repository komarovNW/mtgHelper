import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'localizations/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru')
  ];

  /// No description provided for @skip.
  ///
  /// In ru, this message translates to:
  /// **'Пропустить'**
  String get skip;

  /// No description provided for @ok.
  ///
  /// In ru, this message translates to:
  /// **'Ок'**
  String get ok;

  /// No description provided for @next.
  ///
  /// In ru, this message translates to:
  /// **'Дальше'**
  String get next;

  /// No description provided for @exit.
  ///
  /// In ru, this message translates to:
  /// **'Выход'**
  String get exit;

  /// No description provided for @russian.
  ///
  /// In ru, this message translates to:
  /// **'Русский'**
  String get russian;

  /// No description provided for @english.
  ///
  /// In ru, this message translates to:
  /// **'Английский'**
  String get english;

  /// No description provided for @onboardingTitle1.
  ///
  /// In ru, this message translates to:
  /// **'Аукционы'**
  String get onboardingTitle1;

  /// No description provided for @onboardingText1.
  ///
  /// In ru, this message translates to:
  /// **'Следи и сохраняй интересные тебе аукционы'**
  String get onboardingText1;

  /// No description provided for @onboardingTitle2.
  ///
  /// In ru, this message translates to:
  /// **'Счетчик'**
  String get onboardingTitle2;

  /// No description provided for @onboardingText2.
  ///
  /// In ru, this message translates to:
  /// **'Считай жизни свои и оппонента прямо в приложении'**
  String get onboardingText2;

  /// No description provided for @onboardingTitle3.
  ///
  /// In ru, this message translates to:
  /// **'Коллекция'**
  String get onboardingTitle3;

  /// No description provided for @onboardingText3.
  ///
  /// In ru, this message translates to:
  /// **'Храни и показывай свою коллекцию с телефона'**
  String get onboardingText3;

  /// No description provided for @onboardingTitle4.
  ///
  /// In ru, this message translates to:
  /// **'Статистика'**
  String get onboardingTitle4;

  /// No description provided for @onboardingText4.
  ///
  /// In ru, this message translates to:
  /// **'Записывай все свои матчи чтобы потом проанализировать'**
  String get onboardingText4;

  /// No description provided for @authApp.
  ///
  /// In ru, this message translates to:
  /// **'MTGHelper'**
  String get authApp;

  /// No description provided for @authText.
  ///
  /// In ru, this message translates to:
  /// **'Добро пожаловать'**
  String get authText;

  /// No description provided for @authLogin.
  ///
  /// In ru, this message translates to:
  /// **'Логин'**
  String get authLogin;

  /// No description provided for @authLoginHintText.
  ///
  /// In ru, this message translates to:
  /// **'hello@example.com'**
  String get authLoginHintText;

  /// No description provided for @authLoginErrorText.
  ///
  /// In ru, this message translates to:
  /// **'Пожалуйста, введите логин'**
  String get authLoginErrorText;

  /// No description provided for @authPassword.
  ///
  /// In ru, this message translates to:
  /// **'Пароль'**
  String get authPassword;

  /// No description provided for @authPasswordForgot.
  ///
  /// In ru, this message translates to:
  /// **'Забыли пароль'**
  String get authPasswordForgot;

  /// No description provided for @authPasswordHintText.
  ///
  /// In ru, this message translates to:
  /// **'••••••••••••'**
  String get authPasswordHintText;

  /// No description provided for @authPasswordErrorText.
  ///
  /// In ru, this message translates to:
  /// **'Пожалуйста, введите пароль'**
  String get authPasswordErrorText;

  /// No description provided for @authButton.
  ///
  /// In ru, this message translates to:
  /// **'Войти'**
  String get authButton;

  /// No description provided for @homeTitle.
  ///
  /// In ru, this message translates to:
  /// **'Домашний экран'**
  String get homeTitle;

  /// No description provided for @homeText.
  ///
  /// In ru, this message translates to:
  /// **'Добро пожаловать!'**
  String get homeText;

  /// No description provided for @drawerPrice.
  ///
  /// In ru, this message translates to:
  /// **'Цены'**
  String get drawerPrice;

  /// No description provided for @drawerTrades.
  ///
  /// In ru, this message translates to:
  /// **'Сделки'**
  String get drawerTrades;

  /// No description provided for @drawerAuctions.
  ///
  /// In ru, this message translates to:
  /// **'Аукционы'**
  String get drawerAuctions;

  /// No description provided for @drawerCollection.
  ///
  /// In ru, this message translates to:
  /// **'Коллекция'**
  String get drawerCollection;

  /// No description provided for @drawerStatistic.
  ///
  /// In ru, this message translates to:
  /// **'Статистика'**
  String get drawerStatistic;

  /// No description provided for @drawerScore.
  ///
  /// In ru, this message translates to:
  /// **'Счетчик'**
  String get drawerScore;

  /// No description provided for @drawerCalendar.
  ///
  /// In ru, this message translates to:
  /// **'Календарь'**
  String get drawerCalendar;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
