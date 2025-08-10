import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class AppDropdownMenuTheme {
  AppDropdownMenuTheme._();

  static DropdownMenuThemeData lightDropdownMenuTheme =
      const DropdownMenuThemeData(
        textStyle: TextStyle(color: AppColors.primaryDark),
        menuStyle: MenuStyle(
          backgroundColor: WidgetStatePropertyAll<Color>(Colors.white),
        ),
      );

  static DropdownMenuThemeData darkDropdownMenuTheme =
      const DropdownMenuThemeData(
        textStyle: TextStyle(color: AppColors.white),
        menuStyle: MenuStyle(
          backgroundColor: WidgetStatePropertyAll<Color>(Colors.black),
        ),
      );
}
