import 'package:flutter/material.dart';
import 'package:vet_track/utils/constants/colors.dart';

class AppTabBarTheme {
  AppTabBarTheme._();

  static TabBarThemeData lightTabBarTheme = TabBarThemeData(
    labelPadding: const EdgeInsets.symmetric(horizontal: 6.0),
    indicatorColor: AppColors.primaryGreen,
    splashFactory: NoSplash.splashFactory,
    dividerColor: Colors.transparent,




/*    splashFactory: NoSplash.splashFactory,
    overlayColor: WidgetStateProperty.all(Colors.transparent),
    labelPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    indicatorColor: Colors.blue,
   // padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    labelStyle: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
    unselectedLabelStyle: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),
    indicatorSize: TabBarIndicatorSize.tab,
    dividerColor: Colors.transparent,
    indicator: BoxDecoration(

      border: Border(
        bottom: BorderSide(color: Colors.blue, width: 4.0,),
      ),
    ),*/
  );

  static TabBarThemeData darkTabBarTheme = TabBarThemeData(
      labelPadding: const EdgeInsets.symmetric(horizontal: 6.0),
      indicatorColor: AppColors.primaryGreen,
      splashFactory: NoSplash.splashFactory,
      dividerColor: Colors.transparent);

}