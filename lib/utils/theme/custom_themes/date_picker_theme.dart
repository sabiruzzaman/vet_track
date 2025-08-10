import 'package:flutter/material.dart';
import 'package:vet_track/utils/constants/colors.dart';

class AppDatePickerTheme {
  AppDatePickerTheme._();

  static DatePickerThemeData lightDatePickerTheme = DatePickerThemeData(
    backgroundColor: Colors.white,
    headerBackgroundColor: Colors.green,
    headerForegroundColor: Colors.white,
  );

  static DatePickerThemeData darkDatePickerTheme = DatePickerThemeData(
    backgroundColor: AppColors.primaryDark,
    headerBackgroundColor: Colors.green,
    headerForegroundColor: Colors.white,
  );
}
