import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_flutter_bloc/utils/extension.dart';

@RoutePage()
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
