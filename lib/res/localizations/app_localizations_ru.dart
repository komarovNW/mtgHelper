import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get skip => 'Пропустить';

  @override
  String get ok => 'Ок';

  @override
  String get yes => 'Да';

  @override
  String get no => 'Нет';

  @override
  String get failure => 'Ошибка';

  @override
  String get next => 'Дальше';

  @override
  String get exit => 'Выход';

  @override
  String get russian => 'Русский';

  @override
  String get english => 'Английский';

  @override
  String get email => 'Почта';

  @override
  String get login => 'Логин';

  @override
  String get password => 'Пароль';

  @override
  String get empty => 'Пусто';

  @override
  String get repeatPassword => 'Повторите пароль';

  @override
  String get save => 'Сохранить';

  @override
  String get mail => 'Почта';

  @override
  String get account => 'Аккаунт';

  @override
  String get onboardingTitle1 => 'Аукционы';

  @override
  String get onboardingText1 => 'Следи и сохраняй интересные тебе аукционы';

  @override
  String get onboardingTitle2 => 'Счетчик';

  @override
  String get onboardingText2 =>
      'Считай жизни свои и оппонента прямо в приложении';

  @override
  String get onboardingTitle3 => 'Коллекция';

  @override
  String get onboardingText3 => 'Храни и показывай свою коллекцию с телефона';

  @override
  String get onboardingTitle4 => 'Статистика';

  @override
  String get onboardingText4 =>
      'Записывай все свои матчи чтобы потом проанализировать';

  @override
  String get authApp => 'MTGHelper';

  @override
  String get authText => 'Добро пожаловать';

  @override
  String get authLogin => 'Логин';

  @override
  String get authLoginHintText => 'hello@example.com';

  @override
  String get authLoginErrorText => 'Пожалуйста, введите логин';

  @override
  String get authPassword => 'Пароль';

  @override
  String get authRegistration => 'Регистрация';

  @override
  String get authPasswordHintText => '••••••••••••';

  @override
  String get authPasswordErrorText => 'Пожалуйста, введите пароль';

  @override
  String get authButton => 'Войти';

  @override
  String get homeTitle => 'Домашний экран';

  @override
  String get homeText => 'Добро пожаловать!';

  @override
  String get drawerProfile => 'Профиль';

  @override
  String get drawerSearch => 'Цены';

  @override
  String get drawerTrades => 'Сделки';

  @override
  String get drawerAuctions => 'Аукционы';

  @override
  String get drawerCollection => 'Коллекция';

  @override
  String get drawerStatistic => 'Статистика';

  @override
  String get drawerScore => 'Счетчик';

  @override
  String get drawerCalendar => 'Календарь';

  @override
  String get drawerMatches => 'Матчи';

  @override
  String get scoreTitle => 'Счетчик';

  @override
  String get scoreDialogText => 'Вы точно хотите сбросить счетчик?';

  @override
  String get auctionTitle => 'Аукционы';

  @override
  String get auctionSearch => 'Поиск';

  @override
  String get auctionHintText => 'Например lightning bolt';

  @override
  String get auctionEmptyList => 'По вашему запросу ничего не нашли';

  @override
  String get auctionEmptyFavoritesList =>
      'Вы еще не выбрали избранные аукционы. Не забывайте что максимум 5!';

  @override
  String get auctionTabAll => 'Все';

  @override
  String get auctionTabFavorites => 'Избранные';

  @override
  String get auctionCardDescriptionLot => 'Лот: ';

  @override
  String get auctionCardDescriptionSeller => 'Продавец: ';

  @override
  String get auctionCardDescriptionCurrentBid => 'Максимальная ставка: ';

  @override
  String get auctionCardDescriptionBidAmount => 'Кол-во ставок: ';

  @override
  String get auctionCardDescriptionDateEstimated => 'Дата и время окончания: ';

  @override
  String get auctionCardButtonText => 'Перейти на TopDeck';

  @override
  String get searchBodyEmpty => 'Ничего не найдено';

  @override
  String get searchBodyInitial =>
      'Введите первые 3 буквы названия карты на английском или на русском';

  @override
  String get priceTabTCG => 'TCG';

  @override
  String get priceTabSCG => 'SCG';

  @override
  String get priceTabSingles => 'Синглы';

  @override
  String get priceTabAuctions => 'Ауки';

  @override
  String get priceTCGCardMarket => 'CardMarket';

  @override
  String get priceTCGRegular => 'regular';

  @override
  String get priceTCGFoil => 'foil';

  @override
  String get priceTCGTCG => 'TCG';

  @override
  String get priceTCGEtched => 'etched';

  @override
  String get priceAuctionCurrentTitle => 'Текущие аукционы';

  @override
  String get priceAuctionCurrentEmptyTitle =>
      'На данный момент аукционов с этой картой нет';

  @override
  String get priceAuctionPastTitle => 'Завершенные аукционы';

  @override
  String get priceAuctionPastEmptyTitle => 'Аукционов с этой картой не было';

  @override
  String get profileTitle => 'Профиль';

  @override
  String get matchesEmpty => 'На данный момент у вас нет записанных матчей';

  @override
  String get matchesVS => 'VS';

  @override
  String get matchesResult => 'Результаты игр:';

  @override
  String matchesOpponent(String opponent) {
    return 'Оппонент: $opponent';
  }

  @override
  String get matchesOnPlay => 'Вы начинали первым';

  @override
  String get matchesOnDraw => 'Оппонент начинал первым';

  @override
  String matchRecord(String date) {
    return 'Дата игры: $date';
  }

  @override
  String matchGame(int number) {
    return 'Игра $number:';
  }

  @override
  String get matchFormat => 'Вы начинали первым';

  @override
  String get matchDeckName => 'Ваша колода';

  @override
  String get matchDeckNameOpponent => 'Колода оппонента';

  @override
  String get matchNameOpponent => 'Имя оппонента';
}
