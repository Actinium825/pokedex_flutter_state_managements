import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_flutter_riverpod/apis/model/pokemon.dart';
import 'package:pokedex_flutter_riverpod/extensions/pokemon_ext.dart';
import 'package:pokedex_flutter_riverpod/utils/const.dart';
import 'package:pokedex_flutter_riverpod/utils/extension.dart';
import 'package:pokedex_flutter_riverpod/utils/themes.dart';

class MovesTab extends StatelessWidget {
  const MovesTab({
    required this.selectedPokemon,
    super.key,
  });

  final Pokemon selectedPokemon;

  @override
  Widget build(BuildContext context) {
    final style = context.textTheme.bodyLarge?.copyWith(
      color: context.themeData.brightness == Brightness.light
          ? PokedexTheme.textColorWhite
          : PokedexTheme.textColorDarkMode,
    );

    return SingleChildScrollView(
      padding: movesTabPadding,
      child: Wrap(
        spacing: movesSpacing,
        runSpacing: movesSpacing,
        children: selectedPokemon.moveList.forLoop(
          (move) => ColoredBox(
            color: selectedPokemon.primaryColor,
            child: Padding(
              padding: movesPadding,
              child: Text(
                move.moveInfo.name.split('-').forLoop((word) => word.capitalize()).join(' '),
                style: style,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
