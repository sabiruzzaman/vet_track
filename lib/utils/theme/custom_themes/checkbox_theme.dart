import 'package:flutter/material.dart';

class AppCheckboxTheme {
  AppCheckboxTheme._();

  static CheckboxThemeData lightCheckboxTheme = CheckboxThemeData(
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.green; // ✅ when checked
      }
      return Colors.transparent; // ❌ when not checked
    }),
    checkColor: WidgetStateProperty.all<Color>(Colors.white),
    side: const BorderSide(color: Colors.green, width: 2), // green border always
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    visualDensity: VisualDensity.compact,
  );

  static CheckboxThemeData darkCheckboxTheme = CheckboxThemeData(
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.green;
      }
      return Colors.transparent;
    }),
    checkColor: WidgetStateProperty.all<Color>(Colors.white),
    side: const BorderSide(color: Colors.green, width: 2),
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    visualDensity: VisualDensity.compact,
  );
}
