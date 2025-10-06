import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:pokedex_getx/apis/model/pokemon.dart';
import 'package:pokedex_getx/classes/pokemon_color_picker.dart';
import 'package:pokedex_getx/extensions/pokemon_type_ext.dart';
import 'package:pokedex_getx/utils/const.dart';

extension PokemonExt on Pokemon {
  Color get primaryColor => PokemonColorPicker.getColor(primaryTypeName);

  String get primaryTypeName => typeList.firstOrNull?.name ?? '';

  String get capitalizedNamed => name.capitalizeFirst ?? '';

  String formatId() => '#${id.toString().padLeft(idNumberPadWidth, '0')}';
}
