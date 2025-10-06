import 'package:flutter/material.dart';
import 'package:pokedex_getx/apis/model/pokemon.dart';
import 'package:pokedex_getx/classes/pokemon_color_picker.dart';
import 'package:pokedex_getx/extensions/pokemon_ext.dart';
import 'package:pokedex_getx/extensions/pokemon_type_ext.dart';
import 'package:pokedex_getx/widgets/pokemon_type_name.dart';

class PokemonTypeList extends StatelessWidget {
  const PokemonTypeList({
    required this.pokemon,
    this.isDecorationShown = false,
    super.key,
  });

  final Pokemon pokemon;
  final bool isDecorationShown;

  @override
  Widget build(BuildContext context) {
    final primaryTypeName = pokemon.primaryTypeName;
    final primaryColor = isDecorationShown ? PokemonColorPicker.getColor(primaryTypeName) : null;
    final typeList = pokemon.typeList;
    final children = [
      PokemonTypeName(
        name: primaryTypeName,
        primaryColor: primaryColor,
      ),
      if (typeList.length > 1)
        PokemonTypeName(
          name: typeList[1].name,
          primaryColor: primaryColor,
        ),
    ];

    return switch (isDecorationShown) {
      true => Row(children: children),
      false => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    };
  }
}
