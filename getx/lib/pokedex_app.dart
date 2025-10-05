import 'package:flutter/material.dart';
import 'package:getx/pokemon_list/pokemon_list_page.dart';
import 'package:getx/utils/themes.dart';

class PokedexApp extends StatelessWidget {
  const PokedexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: PokedexTheme.themeRegular,
      darkTheme: PokedexTheme.themeDark,
      home: const PokemonListPage(),
    );
  }
}
