import 'dart:math';

import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_flutter_async_redux/extensions/pokemon_ext.dart';
import 'package:pokedex_flutter_async_redux/feature/pokemon_info/widgets/eevee_arrows.dart';
import 'package:pokedex_flutter_async_redux/model/dto/pokemon_dto.dart';
import 'package:pokedex_flutter_async_redux/utils/const.dart';
import 'package:pokedex_flutter_async_redux/utils/extension.dart';
import 'package:pokedex_flutter_async_redux/widgets/pokemon_image.dart';

class EvolutionCard extends StatelessWidget {
  const EvolutionCard({
    required this.pokemon,
    this.isEevee = false,
    this.index,
    super.key,
  });

  final PokemonDto pokemon;
  final bool isEevee;
  final int? index;

  @override
  Widget build(BuildContext context) {
    final style = context.textTheme.bodyLarge?.copyWith(
      fontSize: 12.0,
      color: pokemon.primaryColor,
    );
    final arrowAngle = switch (index) {
      4 || 5 => 0.0,
      1 || 2 => -pi / 4,
      7 || 8 => pi / 4,
      _ => null,
    };

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (isEevee) const EeveeArrows(pi: -pi),
        Row(
          crossAxisAlignment: index == 1 || index == 2
              ? CrossAxisAlignment.end
              : index == 7 || index == 8
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.center,
          children: [
            if (arrowAngle != null || isEevee)
              Transform.rotate(
                angle: isEevee ? pi : arrowAngle!,
                child: const Icon(Icons.arrow_circle_right),
              ),
            Expanded(
              child: Column(
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
              ),
            ),
            if (isEevee) const Icon(Icons.arrow_circle_right),
          ],
        ),
        if (isEevee) const EeveeArrows(pi: pi),
      ],
    );
  }
}
