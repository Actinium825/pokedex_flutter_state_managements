import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_flutter_riverpod/apis/model/pokemon.dart';
import 'package:pokedex_flutter_riverpod/classes/pokemon_color_picker.dart';
import 'package:pokedex_flutter_riverpod/extensions/pokemon_type_ext.dart';
import 'package:pokedex_flutter_riverpod/utils/const.dart';

extension PokemonExt on Pokemon {
  Color get primaryColor => PokemonColorPicker.getColor(primaryTypeName);

  String get primaryTypeName => typeList.firstOrNull?.name ?? '';

  String get capitalizedNamed => name.capitalize();

  String formatId() => '#${id.toString().padLeft(idNumberPadWidth, '0')}';
}
