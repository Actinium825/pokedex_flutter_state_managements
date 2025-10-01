import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_flutter_async_redux/extensions/pokemon_ext.dart';
import 'package:pokedex_flutter_async_redux/model/dto/pokemon_dto.dart';
import 'package:pokedex_flutter_async_redux/utils/const.dart';
import 'package:pokedex_flutter_async_redux/utils/extension.dart';
import 'package:pokedex_flutter_async_redux/utils/themes.dart';

class MovesTab extends StatelessWidget {
  const MovesTab({
    required this.selectedPokemon,
    super.key,
  });

  final PokemonDto selectedPokemon;

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
        children: selectedPokemon.moveList.map(
          (move) {
            return Container(
              padding: movesPadding,
              color: selectedPokemon.primaryColor,
              child: Text(
                move.moveInfo.name.split('-').map((word) => word.capitalize()).join(' '),
                style: style,
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
