import 'package:equatable/equatable.dart';

import '../../model/language.dart';

class LocaleState extends Equatable {
  const LocaleState({Language? selectedLanguage})
      : selectedLanguage = selectedLanguage ?? Language.english;

  final Language selectedLanguage;

  @override
  List<Object> get props => [selectedLanguage];

  LocaleState copyWith({Language? selectedLanguage}) {
    return LocaleState(
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
    );
  }
}
