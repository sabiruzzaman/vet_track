import 'package:flutter/material.dart';
import 'package:vet_track/utils/theme/custom_themes/bottom_navigation_bar_theme.dart';
import 'package:vet_track/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:vet_track/utils/theme/custom_themes/date_picker_theme.dart';
import 'package:vet_track/utils/theme/custom_themes/drawer_theme.dart';
import 'package:vet_track/utils/theme/custom_themes/dropdown_menu_theme.dart';
import 'package:vet_track/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:vet_track/utils/theme/custom_themes/input_decoration_theme.dart';
import 'package:vet_track/utils/theme/custom_themes/tab_bar_theme.dart';
import 'package:vet_track/utils/theme/custom_themes/text_selection_theme.dart';
import '../constants/colors.dart';
import 'custom_themes/checkbox_theme.dart';
import 'custom_themes/text_theme.dart';
import 'custom_themes/app_bar_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "DM Sans",
    brightness: Brightness.light,
    primaryColor: AppColors.primaryGreen,
    scaffoldBackgroundColor: Colors.white,
    textTheme: AppTextTheme.lightTextTheme,
    appBarTheme: AppAppBarTheme.lightAppBarTheme,
    inputDecorationTheme: AppInputDecorationTheme.lightInputDecorationTheme,
    textSelectionTheme: AppTextSelectionTheme.lightTextSelectionTheme,
    checkboxTheme: AppCheckboxTheme.lightCheckboxTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.lightElevatedButtonTheme,
    bottomNavigationBarTheme: AppBottomNavigationBarTheme.lightBottomNavigationBarTheme,
    bottomSheetTheme: AppBottomSheetTheme.lightBottomSheetTheme,
    drawerTheme: AppDrawerTheme.lightDrawerTheme,
    tabBarTheme: AppTabBarTheme.lightTabBarTheme,
   dropdownMenuTheme: AppDropdownMenuTheme.lightDropdownMenuTheme,
    datePickerTheme: AppDatePickerTheme.lightDatePickerTheme
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "DM Sans",
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryGreen,
    scaffoldBackgroundColor: Colors.black,
    textTheme: AppTextTheme.darkTextTheme,
    appBarTheme: AppAppBarTheme.darkAppBarTheme,
    inputDecorationTheme: AppInputDecorationTheme.darkInputDecorationTheme,
    textSelectionTheme: AppTextSelectionTheme.darkTextSelectionTheme,
    checkboxTheme: AppCheckboxTheme.darkCheckboxTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.darkElevatedButtonTheme,
    bottomNavigationBarTheme:
        AppBottomNavigationBarTheme.darkBottomNavigationBarTheme,
    bottomSheetTheme: AppBottomSheetTheme.darkBottomSheetTheme,
    drawerTheme: AppDrawerTheme.darkDrawerTheme,
      tabBarTheme: AppTabBarTheme.darkTabBarTheme,
      dropdownMenuTheme: AppDropdownMenuTheme.darkDropdownMenuTheme,
    datePickerTheme: AppDatePickerTheme.darkDatePickerTheme
  );
}
