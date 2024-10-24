import 'package:flutter/material.dart';
import 'package:pokedex_flutter_async_redux/extensions/pokemon_ext.dart';
import 'package:pokedex_flutter_async_redux/model/dto/pokemon_dto.dart';
import 'package:pokedex_flutter_async_redux/utils/const.dart';
import 'package:pokedex_flutter_async_redux/utils/extension.dart';
import 'package:pokedex_flutter_async_redux/widgets/pokemon_image.dart';
import 'package:pokedex_flutter_async_redux/widgets/pokemon_type_list.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    required this.pokemon,
    required this.onTap,
    super.key,
  });

  final PokemonDto pokemon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: pokemon.primaryColor,
        child: Stack(
          children: [
            Padding(
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
            Positioned(
              bottom: 0.0,
              right: 0.0,
              child: PokemonImage(
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
