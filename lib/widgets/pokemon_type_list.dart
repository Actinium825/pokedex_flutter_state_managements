import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_flutter_async_redux/extensions/pokemon_ext.dart';
import 'package:pokedex_flutter_async_redux/extensions/pokemon_type_ext.dart';
import 'package:pokedex_flutter_async_redux/widgets/pokemon_type_name.dart';
import 'package:pokedex_flutter_async_redux/model/dto/pokemon_dto.dart';
import 'package:pokedex_flutter_async_redux/classes/pokemon_color_picker.dart';

class PokemonTypeList extends StatelessWidget {
  const PokemonTypeList({
    required this.pokemon,
    this.isDecorationShown = false,
    super.key,
  });

  final PokemonDto pokemon;
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
          name: typeList.second.name,
          primaryColor: primaryColor,
        ),
    ];

    return isDecorationShown
        ? Row(children: children)
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          );
  }
}
