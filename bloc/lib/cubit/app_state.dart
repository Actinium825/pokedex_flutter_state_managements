import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_flutter_bloc/apis/model/pokemon.dart';
import 'package:pokedex_flutter_bloc/apis/model/simple_pokemon_list.dart';
import 'package:pokedex_flutter_bloc/utils/typedef.dart';

part 'app_state.freezed.dart';

@freezed
abstract class AppState with _$AppState {
  const factory AppState({
    @Default(ThemeMode.system) ThemeMode themeMode,
    @Default(SimplePokemonList()) SimplePokemonList simplePokemonList,
    @Default(<Pokemon>[]) PokemonList pokemonList,
    @Default(false) bool isLoading,
  }) = _AppState;
}
