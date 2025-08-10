import 'package:flutter/material.dart';
import '../../constants/colors.dart'; // Adjust path as necessary

class AppTextSelectionTheme {
  AppTextSelectionTheme._();

  static const TextSelectionThemeData lightTextSelectionTheme = TextSelectionThemeData(
      cursorColor: AppColors.primaryGreen,
      selectionColor: AppColors.lightGreen,        // Highlight color when text is selected
      selectionHandleColor: AppColors.primaryGreen // The draggable handle
  );

  static const TextSelectionThemeData darkTextSelectionTheme = TextSelectionThemeData(
      cursorColor: AppColors.lightGreen,
      selectionColor: AppColors.steelGray,         // A darker background for highlight in dark mode
      selectionHandleColor: AppColors.lightGreen
  );
}
