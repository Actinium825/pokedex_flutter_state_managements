import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_getx/apis/model/pokemon.dart';
import 'package:pokedex_getx/extensions/pokemon_ext.dart';
import 'package:pokedex_getx/utils/const.dart';
import 'package:pokedex_getx/widgets/pokemon_image.dart';
import 'package:pokedex_getx/widgets/pokemon_type_list.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    required this.pokemon,
    required this.onTap,
    super.key,
  });

  final Pokemon pokemon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: pokemon.primaryColor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FittedBox(
              child: Padding(
                padding: pokemonCardPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: pokemonNamePadding,
                      child: Text(
                        pokemon.capitalizedNamed,
                        style: context.textTheme.headlineMedium,
                      ),
                    ),
                    PokemonTypeList(pokemon: pokemon),
                  ],
                ),
              ),
            ),
            Expanded(
              child: PokemonImage(
                alignment: Alignment.bottomRight,
                pokemon: pokemon,
                size: pokemonCardSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
