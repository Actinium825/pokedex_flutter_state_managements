import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_getx/apis/model/pokemon.dart';
import 'package:pokedex_getx/extensions/pokemon_ext.dart';
import 'package:pokedex_getx/utils/const.dart';
import 'package:pokedex_getx/utils/extension.dart';
import 'package:pokedex_getx/utils/themes.dart';

class MovesTab extends StatelessWidget {
  const MovesTab({
    required this.selectedPokemon,
    super.key,
  });

  final Pokemon selectedPokemon;

  @override
  Widget build(BuildContext context) {
    final style = context.textTheme.bodyLarge?.copyWith(
      color: !context.isDarkMode ? PokedexTheme.textColorWhite : PokedexTheme.textColorDarkMode,
    );
    final primaryColor = selectedPokemon.primaryColor;

    return SingleChildScrollView(
      padding: movesTabPadding,
      child: Wrap(
        spacing: movesSpacing,
        runSpacing: movesSpacing,
        children: selectedPokemon.moveList.forLoop(
          (move) => Container(
            color: primaryColor,
            padding: movesPadding,
            child: Text(
              move.moveInfo.name.split('-').forLoop((word) => word.capitalizeFirst).join(' '),
              style: style,
            ),
          ),
        ),
      ),
    );
  }
}
