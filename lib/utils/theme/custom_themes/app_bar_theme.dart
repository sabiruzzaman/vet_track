import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppAppBarTheme {
  AppAppBarTheme._();

  static AppBarTheme lightAppBarTheme = AppBarTheme(
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: const IconThemeData(color: Colors.black, size: 24),
    elevation: 0,
    scrolledUnderElevation: 0,
    centerTitle: false,
    actionsIconTheme: const IconThemeData(color: Colors.black, size: 24),
    titleTextStyle: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // app bar এর নিচের রঙ দেখা যাবে
      statusBarIconBrightness: Brightness.dark, // লাইট মোডে কালো আইকন
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  static AppBarTheme darkAppBarTheme = AppBarTheme(
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: const IconThemeData(color: Colors.white, size: 24),
    elevation: 0,
    scrolledUnderElevation: 0,
    centerTitle: false,
    actionsIconTheme: const IconThemeData(color: Colors.white, size: 24),
    titleTextStyle: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // ডার্ক মোডে কালো background
      statusBarIconBrightness: Brightness.light, // সাদা আইকন
      systemNavigationBarColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
}
