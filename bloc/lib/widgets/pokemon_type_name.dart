import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_flutter_bloc/classes/pokemon_color_picker.dart';
import 'package:pokedex_flutter_bloc/utils/const.dart';
import 'package:pokedex_flutter_bloc/utils/extension.dart';

class PokemonTypeName extends StatelessWidget {
  const PokemonTypeName({
    required this.name,
    this.primaryColor,
    super.key,
  });

  final String name;
  final Color? primaryColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: pokemonTypeNamePadding,
      margin: pokemonTypeNameMargin,
      decoration: primaryColor == null
          ? null
          : BoxDecoration(
              color: PokemonColorPicker.typeDecorationColor(primaryColor!),
              borderRadius: BorderRadius.circular(typeNameRadius),
            ),
      child: Text(
        name.capitalize(),
        style: context.textTheme.headlineMedium,
      ),
    );
  }
}
