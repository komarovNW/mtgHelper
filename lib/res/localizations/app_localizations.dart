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

  /// No description provided for @yes.
  ///
  /// In ru, this message translates to:
  /// **'Да'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In ru, this message translates to:
  /// **'Нет'**
  String get no;

  /// No description provided for @failure.
  ///
  /// In ru, this message translates to:
  /// **'Ошибка'**
  String get failure;

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

  /// No description provided for @email.
  ///
  /// In ru, this message translates to:
  /// **'Почта'**
  String get email;

  /// No description provided for @login.
  ///
  /// In ru, this message translates to:
  /// **'Логин'**
  String get login;

  /// No description provided for @password.
  ///
  /// In ru, this message translates to:
  /// **'Пароль'**
  String get password;

  /// No description provided for @empty.
  ///
  /// In ru, this message translates to:
  /// **'Пусто'**
  String get empty;

  /// No description provided for @repeatPassword.
  ///
  /// In ru, this message translates to:
  /// **'Повторите пароль'**
  String get repeatPassword;

  /// No description provided for @save.
  ///
  /// In ru, this message translates to:
  /// **'Сохранить'**
  String get save;

  /// No description provided for @mail.
  ///
  /// In ru, this message translates to:
  /// **'Почта'**
  String get mail;

  /// No description provided for @account.
  ///
  /// In ru, this message translates to:
  /// **'Логин'**
  String get account;

  /// No description provided for @month.
  ///
  /// In ru, this message translates to:
  /// **'Месяц'**
  String get month;

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

  /// No description provided for @authRegistration.
  ///
  /// In ru, this message translates to:
  /// **'Регистрация'**
  String get authRegistration;

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

  /// No description provided for @drawerProfile.
  ///
  /// In ru, this message translates to:
  /// **'Профиль'**
  String get drawerProfile;

  /// No description provided for @drawerSearch.
  ///
  /// In ru, this message translates to:
  /// **'Цены'**
  String get drawerSearch;

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

  /// No description provided for @drawerMatches.
  ///
  /// In ru, this message translates to:
  /// **'Матчи'**
  String get drawerMatches;

  /// No description provided for @scoreTitle.
  ///
  /// In ru, this message translates to:
  /// **'Счетчик'**
  String get scoreTitle;

  /// No description provided for @scoreDialogText.
  ///
  /// In ru, this message translates to:
  /// **'Вы точно хотите сбросить счетчик?'**
  String get scoreDialogText;

  /// No description provided for @auctionTitle.
  ///
  /// In ru, this message translates to:
  /// **'Аукционы'**
  String get auctionTitle;

  /// No description provided for @auctionSearch.
  ///
  /// In ru, this message translates to:
  /// **'Поиск'**
  String get auctionSearch;

  /// No description provided for @auctionHintText.
  ///
  /// In ru, this message translates to:
  /// **'Например lightning bolt'**
  String get auctionHintText;

  /// No description provided for @auctionEmptyList.
  ///
  /// In ru, this message translates to:
  /// **'По вашему запросу ничего не нашли'**
  String get auctionEmptyList;

  /// No description provided for @auctionEmptyFavoritesList.
  ///
  /// In ru, this message translates to:
  /// **'Вы еще не выбрали избранные аукционы. Не забывайте что максимум 5!'**
  String get auctionEmptyFavoritesList;

  /// No description provided for @auctionTabAll.
  ///
  /// In ru, this message translates to:
  /// **'Все'**
  String get auctionTabAll;

  /// No description provided for @auctionTabFavorites.
  ///
  /// In ru, this message translates to:
  /// **'Избранные'**
  String get auctionTabFavorites;

  /// No description provided for @auctionCardDescriptionLot.
  ///
  /// In ru, this message translates to:
  /// **'Лот: '**
  String get auctionCardDescriptionLot;

  /// No description provided for @auctionCardDescriptionSeller.
  ///
  /// In ru, this message translates to:
  /// **'Продавец: '**
  String get auctionCardDescriptionSeller;

  /// No description provided for @auctionCardDescriptionCurrentBid.
  ///
  /// In ru, this message translates to:
  /// **'Максимальная ставка: '**
  String get auctionCardDescriptionCurrentBid;

  /// No description provided for @auctionCardDescriptionCurrentBidMin.
  ///
  /// In ru, this message translates to:
  /// **'Макс: '**
  String get auctionCardDescriptionCurrentBidMin;

  /// No description provided for @auctionCardDescriptionBidAmount.
  ///
  /// In ru, this message translates to:
  /// **'Кол-во ставок: '**
  String get auctionCardDescriptionBidAmount;

  /// No description provided for @auctionCardDescriptionDateEstimated.
  ///
  /// In ru, this message translates to:
  /// **'Дата и время окончания: '**
  String get auctionCardDescriptionDateEstimated;

  /// No description provided for @auctionCardButtonText.
  ///
  /// In ru, this message translates to:
  /// **'Перейти на TopDeck'**
  String get auctionCardButtonText;

  /// No description provided for @auctionCardDialogConfirmation.
  ///
  /// In ru, this message translates to:
  /// **'Подтверждение'**
  String get auctionCardDialogConfirmation;

  /// No description provided for @auctionCardDialogGoToSelectedAuc.
  ///
  /// In ru, this message translates to:
  /// **'Хотите перейти на выбранный аукцион?'**
  String get auctionCardDialogGoToSelectedAuc;

  /// No description provided for @searchBodyEmpty.
  ///
  /// In ru, this message translates to:
  /// **'Ничего не найдено'**
  String get searchBodyEmpty;

  /// No description provided for @searchBodyInitial.
  ///
  /// In ru, this message translates to:
  /// **'Введите первые 3 буквы названия карты на английском или на русском'**
  String get searchBodyInitial;

  /// No description provided for @priceTabTCG.
  ///
  /// In ru, this message translates to:
  /// **'TCG'**
  String get priceTabTCG;

  /// No description provided for @priceTabSCG.
  ///
  /// In ru, this message translates to:
  /// **'SCG'**
  String get priceTabSCG;

  /// No description provided for @priceTabSingles.
  ///
  /// In ru, this message translates to:
  /// **'Синглы'**
  String get priceTabSingles;

  /// No description provided for @priceTabAuctions.
  ///
  /// In ru, this message translates to:
  /// **'Ауки'**
  String get priceTabAuctions;

  /// No description provided for @priceTCGCardMarket.
  ///
  /// In ru, this message translates to:
  /// **'CardMarket'**
  String get priceTCGCardMarket;

  /// No description provided for @priceTCGRegular.
  ///
  /// In ru, this message translates to:
  /// **'regular'**
  String get priceTCGRegular;

  /// No description provided for @priceTCGFoil.
  ///
  /// In ru, this message translates to:
  /// **'foil'**
  String get priceTCGFoil;

  /// No description provided for @priceTCGTCG.
  ///
  /// In ru, this message translates to:
  /// **'TCG'**
  String get priceTCGTCG;

  /// No description provided for @priceTCGEtched.
  ///
  /// In ru, this message translates to:
  /// **'etched'**
  String get priceTCGEtched;

  /// No description provided for @priceAuctionCurrentTitle.
  ///
  /// In ru, this message translates to:
  /// **'Текущие аукционы'**
  String get priceAuctionCurrentTitle;

  /// No description provided for @priceAuctionCurrentEmptyTitle.
  ///
  /// In ru, this message translates to:
  /// **'На данный момент аукционов с этой картой нет'**
  String get priceAuctionCurrentEmptyTitle;

  /// No description provided for @priceAuctionPastTitle.
  ///
  /// In ru, this message translates to:
  /// **'Завершенные аукционы'**
  String get priceAuctionPastTitle;

  /// No description provided for @priceAuctionPastEmptyTitle.
  ///
  /// In ru, this message translates to:
  /// **'Аукционов с этой картой не было'**
  String get priceAuctionPastEmptyTitle;

  /// No description provided for @profileTitle.
  ///
  /// In ru, this message translates to:
  /// **'Профиль'**
  String get profileTitle;

  /// No description provided for @match.
  ///
  /// In ru, this message translates to:
  /// **'Матч'**
  String get match;

  /// No description provided for @matchesEmpty.
  ///
  /// In ru, this message translates to:
  /// **'На данный момент у вас нет записанных матчей'**
  String get matchesEmpty;

  /// No description provided for @matchesVS.
  ///
  /// In ru, this message translates to:
  /// **'VS'**
  String get matchesVS;

  /// No description provided for @matchesResult.
  ///
  /// In ru, this message translates to:
  /// **'Результаты игр:'**
  String get matchesResult;

  /// No description provided for @matchesOpponent.
  ///
  /// In ru, this message translates to:
  /// **'Оппонент: {opponent}'**
  String matchesOpponent(String opponent);

  /// No description provided for @matchesOnPlay.
  ///
  /// In ru, this message translates to:
  /// **'Вы начинали первым'**
  String get matchesOnPlay;

  /// No description provided for @matchesOnDraw.
  ///
  /// In ru, this message translates to:
  /// **'Оппонент начинал первым'**
  String get matchesOnDraw;

  /// No description provided for @matchRecord.
  ///
  /// In ru, this message translates to:
  /// **'Дата игры: {date}'**
  String matchRecord(String date);

  /// No description provided for @matchGame.
  ///
  /// In ru, this message translates to:
  /// **'Игра {number}:'**
  String matchGame(int number);

  /// No description provided for @matchFormat.
  ///
  /// In ru, this message translates to:
  /// **'Формат'**
  String get matchFormat;

  /// No description provided for @matchDeckName.
  ///
  /// In ru, this message translates to:
  /// **'Колода'**
  String get matchDeckName;

  /// No description provided for @matchDeckNameOpponent.
  ///
  /// In ru, this message translates to:
  /// **'Колода оппонента'**
  String get matchDeckNameOpponent;

  /// No description provided for @matchNameOpponent.
  ///
  /// In ru, this message translates to:
  /// **'Имя оппонента'**
  String get matchNameOpponent;

  /// No description provided for @matchComment.
  ///
  /// In ru, this message translates to:
  /// **'Комментарий'**
  String get matchComment;

  /// No description provided for @dollar.
  ///
  /// In ru, this message translates to:
  /// **'Доллар'**
  String get dollar;

  /// No description provided for @euro.
  ///
  /// In ru, this message translates to:
  /// **'Евро'**
  String get euro;

  /// No description provided for @customCourse.
  ///
  /// In ru, this message translates to:
  /// **'Кастомный курс'**
  String get customCourse;

  /// No description provided for @calendar.
  ///
  /// In ru, this message translates to:
  /// **'Календарь'**
  String get calendar;

  /// No description provided for @calendarFormatTournament.
  ///
  /// In ru, this message translates to:
  /// **'Форматы турниров'**
  String get calendarFormatTournament;

  /// No description provided for @calendarChooseCity.
  ///
  /// In ru, this message translates to:
  /// **'Выберите город'**
  String get calendarChooseCity;

  /// No description provided for @calendarAllCites.
  ///
  /// In ru, this message translates to:
  /// **'Все города'**
  String get calendarAllCites;

  /// No description provided for @calendarChooseDate.
  ///
  /// In ru, this message translates to:
  /// **'Выберите дату'**
  String get calendarChooseDate;

  /// No description provided for @calendarNoTournaments.
  ///
  /// In ru, this message translates to:
  /// **'Нет турниров'**
  String get calendarNoTournaments;

  /// No description provided for @calendarCity.
  ///
  /// In ru, this message translates to:
  /// **'Город: '**
  String get calendarCity;

  /// No description provided for @calendarTime.
  ///
  /// In ru, this message translates to:
  /// **'Время: '**
  String get calendarTime;

  /// No description provided for @calendarPrice.
  ///
  /// In ru, this message translates to:
  /// **'Стоимость: '**
  String get calendarPrice;

  /// No description provided for @calendarCommit.
  ///
  /// In ru, this message translates to:
  /// **'Комментарий: '**
  String get calendarCommit;
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
