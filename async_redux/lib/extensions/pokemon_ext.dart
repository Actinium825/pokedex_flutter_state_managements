import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_flutter_async_redux/apis/model/pokemon.dart';
import 'package:pokedex_flutter_async_redux/classes/pokemon_color_picker.dart';
import 'package:pokedex_flutter_async_redux/extensions/pokemon_type_ext.dart';
import 'package:pokedex_flutter_async_redux/utils/const.dart';

extension PokemonExt on Pokemon {
  Color get primaryColor => PokemonColorPicker.getColor(primaryTypeName);

  String get primaryTypeName => typeList.firstOrNull?.name ?? '';

  String get capitalizedNamed => name.capitalize();

  String formatId() => '#${id.toString().padLeft(idNumberPadWidth, '0')}';
}
