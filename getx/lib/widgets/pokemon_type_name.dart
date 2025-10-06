import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/classes/pokemon_color_picker.dart';
import 'package:getx/utils/const.dart';

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
      decoration: switch (primaryColor == null) {
        true => null,
        false => BoxDecoration(
          color: PokemonColorPicker.typeDecorationColor(primaryColor!),
          borderRadius: BorderRadius.circular(typeNameRadius),
        ),
      },
      child: Text(
        name.capitalizeFirst ?? '',
        style: context.textTheme.headlineMedium,
      ),
    );
  }
}
