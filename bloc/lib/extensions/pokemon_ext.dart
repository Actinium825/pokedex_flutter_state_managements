import 'package:dartx/dartx.dart';
import 'package:flutter/animation.dart';
import 'package:pokedex_flutter_bloc/apis/model/pokemon.dart';
import 'package:pokedex_flutter_bloc/classes/pokemon_color_picker.dart';
import 'package:pokedex_flutter_bloc/extensions/pokemon_type_ext.dart';
import 'package:pokedex_flutter_bloc/utils/const.dart';

extension PokemonExt on Pokemon {
  Color get primaryColor => PokemonColorPicker.getColor(primaryTypeName);

  String get primaryTypeName => typeList.firstOrNull?.name ?? '';

  String get capitalizedNamed => name.capitalize();

  String formatId() => '#${id.toString().padLeft(idNumberPadWidth, '0')}';
}
