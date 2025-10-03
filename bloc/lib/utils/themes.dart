import 'package:flutter/material.dart';

class PokedexTheme {
  static const _unselectedWidgetColor = Colors.grey;
  static const _indicatorColor = Colors.transparent;
  static const textColorWhite = Colors.white;

  static final themeRegular = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.white,
    useMaterial3: true,
    unselectedWidgetColor: _unselectedWidgetColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: textColorWhite,
        fontWeight: FontWeight.bold,
        fontSize: 32.0,
      ),
      displayMedium: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 24.0,
      ),
      displaySmall: TextStyle(
        color: textColorWhite,
        fontWeight: FontWeight.bold,
        fontSize: 16.0,
      ),
      headlineMedium: TextStyle(
        color: textColorWhite,
        fontWeight: FontWeight.bold,
        fontSize: 14.0,
      ),
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(
        fontSize: 18.0,
        color: textColorWhite,
      ),
    ),
    tabBarTheme: const TabBarThemeData(indicatorColor: _indicatorColor),
  );
}
