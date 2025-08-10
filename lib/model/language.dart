import 'dart:ui';

enum Language {
  english(
    Locale('en', 'US'),
    'English',
    'A'
  ),
  bangla(
    Locale('bn', 'BD'),
    'বাংলা',
    'অ'

  );

  const Language(this.value, this.text, this.shortText);

  final Locale value;
  final String text;
  final String shortText;
}
