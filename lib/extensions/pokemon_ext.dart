import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_flutter_async_redux/apis/model/pokemon.dart';
import 'package:pokedex_flutter_async_redux/classes/pokemon_color_picker.dart';
import 'package:pokedex_flutter_async_redux/extensions/pokemon_ability_ext.dart';
import 'package:pokedex_flutter_async_redux/extensions/pokemon_base_stat_ext.dart';
import 'package:pokedex_flutter_async_redux/extensions/pokemon_info_ext.dart';
import 'package:pokedex_flutter_async_redux/extensions/pokemon_move_ext.dart';
import 'package:pokedex_flutter_async_redux/extensions/pokemon_sprites_ext.dart';
import 'package:pokedex_flutter_async_redux/extensions/pokemon_type_ext.dart';
import 'package:pokedex_flutter_async_redux/model/dto/pokemon_dto.dart';
import 'package:pokedex_flutter_async_redux/model/dto/pokemon_info_dto.dart';
import 'package:pokedex_flutter_async_redux/model/dto/pokemon_sprites_dto.dart';
import 'package:pokedex_flutter_async_redux/utils/const.dart';

extension PokemonExt on Pokemon {
  PokemonDto toDto() => PokemonDto(
        name: name ?? '',
        abilityList: [...?abilityList?.map((ability) => ability.toDto())],
        baseExperience: baseExperience ?? 0,
        baseStatList: [...?baseStatList?.map((baseStat) => baseStat.toDto())],
        heightInDecimeters: heightInDecimeters ?? 0,
        id: id ?? 0,
        moveList: [...?moveList?.map((move) => move.toDto())],
        speciesInfo: speciesInfo?.toDto() ?? const PokemonInfoDto(),
        sprites: sprites?.toDto() ?? const PokemonSpritesDto(),
        typeList: [...?typeList?.map((type) => type.toDto())],
        weightInDecimeters: weightInDecimeters ?? 0,
      );
}

extension PokemonDtoExt on PokemonDto {
  Color get primaryColor => PokemonColorPicker.getColor(primaryTypeName);

  String get primaryTypeName => typeList.firstOrNull?.name ?? '';

  String get capitalizedNamed => name.capitalize();

  String formatId() => '#${id.toString().padLeft(idNumberPadWidth, '0')}';
}
