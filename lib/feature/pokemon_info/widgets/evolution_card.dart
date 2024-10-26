import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_flutter_async_redux/extensions/pokemon_ext.dart';
import 'package:pokedex_flutter_async_redux/model/dto/pokemon_dto.dart';
import 'package:pokedex_flutter_async_redux/utils/const.dart';
import 'package:pokedex_flutter_async_redux/utils/extension.dart';
import 'package:pokedex_flutter_async_redux/widgets/pokemon_image.dart';

class EvolutionCard extends StatelessWidget {
  const EvolutionCard({
    required this.pokemon,
    super.key,
  });

  final PokemonDto pokemon;

  @override
  Widget build(BuildContext context) {
    final style = context.textTheme.bodyLarge?.copyWith(
      fontSize: 12.0,
      color: pokemon.primaryColor,
    );

    return Column(
      children: [
        PokemonImage(
          pokemon: pokemon,
          tag: UniqueKey(),
          size: evolutionCardImageSize,
        ),
        Text(
          pokemon.formatId(),
          style: style,
        ),
        Text(
          pokemon.name.capitalize(),
          style: style,
        ),
      ],
    );
  }
}
