import 'package:flutter/material.dart';
import 'package:pokedex_flutter_async_redux/utils/router.dart';
import 'package:pokedex_flutter_async_redux/utils/themes.dart';

class PokedexApp extends StatelessWidget {
  const PokedexApp({
    required this.savedThemeMode,
    super.key,
  });

  final ThemeMode savedThemeMode;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      themeMode: savedThemeMode,
      theme: PokedexTheme.themeRegular,
      darkTheme: PokedexTheme.themeDark,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
    );
  }
}
