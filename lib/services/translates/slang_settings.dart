import 'package:track_dog/i18n/strings.g.dart';

changeLanguage(AppLocale lang) {
  LocaleSettings.setLocale(lang);
}

getLanguageCode() => LocaleSettings.currentLocale.languageCode;
