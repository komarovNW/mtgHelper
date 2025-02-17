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
  String get next => 'Дальше';

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
  String get authPasswordForgot => 'Забыли пароль';

  @override
  String get authPasswordHintText => '••••••••••••';

  @override
  String get authPasswordErrorText => 'Пожалуйста, введите пароль';

  @override
  String get authButton => 'Войти';
}
