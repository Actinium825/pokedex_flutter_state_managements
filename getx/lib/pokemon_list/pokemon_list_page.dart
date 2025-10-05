import 'package:flutter/material.dart';
import 'package:getx/utils/extension.dart';

class PokemonListPage extends StatelessWidget {
  const PokemonListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pokedex',
          style: context.textTheme.displayMedium,
        ),
      ),
    );
  }
}
