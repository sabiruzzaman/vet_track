import '../../model/language.dart';

class LocaleHelper {
  static final LocaleHelper _instance = LocaleHelper._internal();
  factory LocaleHelper() => _instance;

  LocaleHelper._internal();

  Language? _currentLanguage;

  void updateLanguage(Language language) {
    _currentLanguage = language;
  }

  Language get currentLanguage => _currentLanguage ?? Language.english;

  bool get isBangla => currentLanguage == Language.bangla;
}
