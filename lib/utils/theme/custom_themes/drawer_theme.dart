import 'package:flutter/material.dart';

class AppDrawerTheme {
  AppDrawerTheme._();

  static final DrawerThemeData lightDrawerTheme = DrawerThemeData(
    backgroundColor: Colors.white,
    elevation: 0,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.zero,
    ),
    surfaceTintColor: Colors.transparent,
    scrimColor: Colors.black45,
  );


  static final DrawerThemeData darkDrawerTheme = DrawerThemeData(
    backgroundColor: Colors.black,
    elevation: 0,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.zero,
    ),
    surfaceTintColor: Colors.transparent,
    scrimColor: Colors.white10,
  );
}
