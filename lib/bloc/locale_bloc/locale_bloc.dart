import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/language.dart';
import '../../utils/constants/locale_helper.dart';
import 'locale_event.dart';
import 'locale_state.dart';

const _languagePrefsKey = 'languagePrefs';

class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  LocaleBloc() : super(const LocaleState()) {
    on<ChangeLocaleEvent>(_onChangeLocale);
    on<LoadLocaleEvent>(_onLoadLocale);

    // Bloc শুরুতেই লোড ইভেন্ট ট্রিগার
    add(LoadLocaleEvent());
  }

  Future<void> _onChangeLocale(
      ChangeLocaleEvent event, Emitter<LocaleState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _languagePrefsKey,
      event.selectedLanguage.value.languageCode,
    );

    LocaleHelper().updateLanguage(event.selectedLanguage);

    emit(state.copyWith(selectedLanguage: event.selectedLanguage));
  }

  Future<void> _onLoadLocale(
      LoadLocaleEvent event, Emitter<LocaleState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    final savedCode = prefs.getString(_languagePrefsKey);

    final selectedLanguage = Language.values.firstWhere(
          (lang) => lang.value.languageCode == savedCode,
      orElse: () => Language.english,
    );

    LocaleHelper().updateLanguage(selectedLanguage);

    emit(state.copyWith(selectedLanguage: selectedLanguage));
  }

}
