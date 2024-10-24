import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_flutter_async_redux/utils/const.dart';
import 'package:pokedex_flutter_async_redux/utils/extension.dart';
import 'package:pokedex_flutter_async_redux/utils/pokemon_color_picker.dart';

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
              color: PokemonColorPicker.typeDecorationColor(primaryColor ?? Colors.transparent),
              border: Border.all(color: Colors.transparent),
              borderRadius: BorderRadius.circular(typeNameRadius),
            ),
      child: Text(
        name.capitalize(),
        style: context.textTheme.headlineMedium,
      ),
    );
  }
}
