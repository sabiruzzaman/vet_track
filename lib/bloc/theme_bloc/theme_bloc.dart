import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vet_track/utils/theme/theme.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  static const _prefKey = 'isDarkTheme';

  ThemeBloc() : super(ThemeState(themeData: AppTheme.lightTheme)) {
    on<LoadThemeEvent>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      final isDark = prefs.getBool(_prefKey) ?? false;
      emit(ThemeState(themeData: isDark ? AppTheme.darkTheme : AppTheme.lightTheme));
    });

    on<ToggleThemeEvent>((event, emit) async {
      final isDark = state.themeData.brightness == Brightness.dark;
      final newTheme = isDark ? AppTheme.lightTheme : AppTheme.darkTheme;

      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_prefKey, !isDark);

      // Set system UI overlay style manually
      SystemChrome.setSystemUIOverlayStyle(
        isDark
            ? SystemUiOverlayStyle.dark
            : SystemUiOverlayStyle.light,
      );

      emit(ThemeState(themeData: newTheme));
    });

    // Bloc শুরুতেই থিম লোড করুন
    add(LoadThemeEvent());
  }
}
