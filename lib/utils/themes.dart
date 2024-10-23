import 'package:flutter/material.dart';

class PokedexTheme {
  static const _unselectedWidgetColor = Colors.grey;
  static const _indicatorColor = Colors.transparent;
  static const _textColorWhite = Colors.white;
  static const _textColorDarkMode = Colors.black38;

  static ThemeData themeRegular = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.white,
    unselectedWidgetColor: _unselectedWidgetColor,
    indicatorColor: _indicatorColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: _textColorWhite,
        fontWeight: FontWeight.bold,
        fontSize: 32.0,
      ),
      displayMedium: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 24.0,
      ),
      displaySmall: TextStyle(
        color: _textColorWhite,
        fontWeight: FontWeight.bold,
        fontSize: 16.0,
      ),
      headlineMedium: TextStyle(
        color: _textColorWhite,
        fontWeight: FontWeight.bold,
        fontSize: 14.0,
      ),
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(
        fontSize: 18.0,
        color: _textColorWhite,
      ),
    ),
    cardTheme: CardTheme(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0))),
    appBarTheme: const AppBarTheme(elevation: 0.0),
  );

  static ThemeData themeDark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color.fromARGB(255, 77, 72, 72),
    unselectedWidgetColor: _unselectedWidgetColor,
    indicatorColor: _indicatorColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: _textColorDarkMode,
        fontWeight: FontWeight.bold,
        fontSize: 32.0,
      ),
      displayMedium: TextStyle(
        color: _textColorWhite,
        fontWeight: FontWeight.bold,
        fontSize: 24.0,
      ),
      displaySmall: TextStyle(
        color: _textColorDarkMode,
        fontWeight: FontWeight.bold,
        fontSize: 16.0,
      ),
      headlineMedium: TextStyle(
        color: _textColorDarkMode,
        fontWeight: FontWeight.bold,
        fontSize: 14.0,
      ),
      bodyLarge: TextStyle(color: _textColorDarkMode),
      bodyMedium: TextStyle(
        fontSize: 18.0,
        color: _textColorDarkMode,
      ),
    ),
    cardTheme: CardTheme(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0))),
    appBarTheme: const AppBarTheme(elevation: 0.0),
  );
}
