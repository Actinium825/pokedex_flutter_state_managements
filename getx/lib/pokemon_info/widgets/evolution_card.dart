import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_getx/apis/model/pokemon.dart';
import 'package:pokedex_getx/extensions/pokemon_ext.dart';
import 'package:pokedex_getx/pokemon_info/widgets/eevee_arrows.dart';
import 'package:pokedex_getx/utils/const.dart';
import 'package:pokedex_getx/widgets/pokemon_image.dart';

class EvolutionCard extends StatelessWidget {
  const EvolutionCard({
    required this.pokemon,
    this.isEevee = false,
    this.index,
    super.key,
  });

  final Pokemon pokemon;
  final bool isEevee;
  final int? index;

  CrossAxisAlignment get _crossAxisAlignment => switch (index) {
    1 || 2 => CrossAxisAlignment.end,
    7 || 8 => CrossAxisAlignment.start,
    _ => CrossAxisAlignment.center,
  };

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
          crossAxisAlignment: _crossAxisAlignment,
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
                    pokemon.capitalizedNamed,
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
