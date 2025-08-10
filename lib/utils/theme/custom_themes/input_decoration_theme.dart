import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class AppInputDecorationTheme {
  AppInputDecorationTheme._();

  static final InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    filled: true,
    fillColor: AppColors.white,
    labelStyle: const TextStyle(
      color: AppColors.steelGray, // Default label color (when not focused)
      fontWeight: FontWeight.w500,
    ),
    floatingLabelStyle: WidgetStateTextStyle.resolveWith((states) {
      if (states.contains(WidgetState.focused)) {
        return const TextStyle(
          color: AppColors.primaryGreen, // Label color when focused
          fontWeight: FontWeight.w500,
        );
      }
      return const TextStyle(
        color: AppColors.steelGray, // Default label color
        fontWeight: FontWeight.w500,
      );
    }),
    contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(
        color: Colors.grey.shade300,
        width: 1.5,
      ),
    ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      borderSide: BorderSide(
        color: AppColors.primaryGreen,
        width: 2.0,
      ),
    ),
    errorBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      borderSide: BorderSide(
        color: AppColors.errorRed,
        width: 1.5,
      ),
    ),
    focusedErrorBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      borderSide: BorderSide(
        color: AppColors.errorRed,
        width: 2.0,
      ),
    ),
  );

  static final InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    filled: true,
    fillColor: AppColors.primaryDark,
    labelStyle: const TextStyle(
      color: AppColors.lightGreen,
      fontWeight: FontWeight.w500,
    ),
    contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(
        color: Colors.grey.shade600,
        width: 1.5,
      ),
    ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      borderSide: BorderSide(
        color: AppColors.lightGreen,
        width: 2.0,
      ),
    ),
    errorBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      borderSide: BorderSide(
        color: AppColors.errorRed,
        width: 1.5,
      ),
    ),
    focusedErrorBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      borderSide: BorderSide(
        color: AppColors.errorRed,
        width: 2.0,
      ),
    ),
  );

}
