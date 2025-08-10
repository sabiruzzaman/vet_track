import 'package:flutter/material.dart';
import 'package:vet_track/utils/constants/colors.dart';

class AppBottomNavigationBarTheme {
  AppBottomNavigationBarTheme._();

  static final lightBottomNavigationBarTheme = BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: AppColors.primaryGreen,
    unselectedItemColor: AppColors.primaryDark,
    selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
    unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
    showUnselectedLabels: true,
    type: BottomNavigationBarType.fixed,
  );

  static final darkBottomNavigationBarTheme = BottomNavigationBarThemeData(
    backgroundColor: Colors.black,
    selectedItemColor: AppColors.primaryGreen,
    unselectedItemColor: AppColors.primaryDark,
    selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
    unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
    showUnselectedLabels: true,
    type: BottomNavigationBarType.fixed,
  );
}
