import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:getx/apis/model/pokemon.dart';
import 'package:getx/classes/pokemon_color_picker.dart';
import 'package:getx/extensions/pokemon_type_ext.dart';

extension PokemonExt on Pokemon {
  Color get primaryColor => PokemonColorPicker.getColor(primaryTypeName);

  String get primaryTypeName => typeList.firstOrNull?.name ?? '';

  String get capitalizedNamed => name.capitalizeFirst ?? '';
}
