import 'package:aak_tele_science/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final _inputFieldBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(color: AppPallete.greyColor, width: 1),
  );

  static final darkThemeMode = ThemeData.dark().copyWith(
      scaffoldBackgroundColor: AppPallete.backgroundColor,
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(27),
        enabledBorder: _inputFieldBorder,
        focusedBorder: _inputFieldBorder,
        errorBorder: _inputFieldBorder.copyWith(
          borderSide: const BorderSide(color: AppPallete.errorColor, width: 1),
        ),
      ),
      elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
          fixedSize: MaterialStatePropertyAll(
            Size(395, 55),
          ),
        ),
      ));

  static final lightThemeMode = ThemeData.light().copyWith(
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(16),
        enabledBorder: _inputFieldBorder,
        focusedBorder: _inputFieldBorder,
        focusedErrorBorder: _inputFieldBorder,
        errorBorder: _inputFieldBorder.copyWith(
          borderSide: const BorderSide(color: AppPallete.errorColor, width: 1),
        ),
      ),
      elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
          fixedSize: MaterialStatePropertyAll(
            Size(395, 55),
          ),
        ),
      ));
}
