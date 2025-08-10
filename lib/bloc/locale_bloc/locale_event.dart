
import 'package:equatable/equatable.dart';

import '../../model/language.dart';

abstract class LocaleEvent extends Equatable {
  const LocaleEvent();

  @override
  List<Object> get props => [];
}

class ChangeLocaleEvent extends LocaleEvent {
  const ChangeLocaleEvent({required this.selectedLanguage});
  final Language selectedLanguage;

  @override
  List<Object> get props => [selectedLanguage];
}

class LoadLocaleEvent extends LocaleEvent {}
