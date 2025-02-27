# mtg_helper
Приложение для игроков и коллекционеров карточной игры magic the gathering.

## Описание
Счетчик жизней, поиск карты, сортировка коллекции, отслеживание аукционов на сайте topdeck.ru и много чего еще в будущем.

## Технологии
- **Flutter** — для разработки мобильных приложений.
- **Dart** — основной язык программирования.
- **BLoC** — для управления состоянием.
- **Flutter Localizations** — для локализации приложения.
- **GitHub Actions** — для CI/CD.
- continue

## Установка

Для того чтобы запустить проект локально, следуй этим шагам:

1. Клонируй репозиторий:
   ```bash
   git clone https://github.com/mtgHelper.git
   cd mtgHelper
   flutter pub get
   flutter run


## CI/CD
Этот проект использует GitHub Actions для автоматической проверки кода, линтинга и сборки приложения при каждом пуше и pull request.

## Freezed
```flutter pub run build_runner build --delete-conflicting-outputs```

## Mason
```mason make features```
Название фичи

## Перед пушом
```flutter analyze .```
```Dart format```