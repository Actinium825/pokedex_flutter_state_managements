import 'package:flutter/material.dart';
import 'package:pokedex_flutter_async_redux/extensions/pokemon_ext.dart';
import 'package:pokedex_flutter_async_redux/model/dto/pokemon_dto.dart';
import 'package:pokedex_flutter_async_redux/utils/const.dart';
import 'package:pokedex_flutter_async_redux/utils/extension.dart';
import 'package:pokedex_flutter_async_redux/widgets/pokemon_image.dart';
import 'package:pokedex_flutter_async_redux/widgets/pokemon_type_list.dart';

class PokemonInfoPage extends StatelessWidget {
  const PokemonInfoPage({
    required this.selectedPokemon,
    super.key,
  });

  final PokemonDto selectedPokemon;

  @override
  Widget build(BuildContext context) {
    final primaryColor = selectedPokemon.primaryColor;
    final textTheme = context.textTheme;

    return Scaffold(
      appBar: AppBar(backgroundColor: primaryColor),
      backgroundColor: primaryColor,
      body: Column(
        children: [
          Padding(
            padding: infoPageHeaderPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  selectedPokemon.capitalizedNamed,
                  style: textTheme.displayLarge,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '#${selectedPokemon.id.toString().padLeft(idNumberPadWidth, '0')}',
                    style: textTheme.displaySmall,
                  ),
                ),
                PokemonTypeList(
                  pokemon: selectedPokemon,
                  isDecorationShown: true,
                ),
                PokemonImage(
                  pokemon: selectedPokemon,
                  size: infoPageImageSize,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
