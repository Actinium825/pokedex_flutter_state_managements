import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_flutter_async_redux/model/dto/pokemon_dto.dart';
import 'package:pokedex_flutter_async_redux/model/dto/simple_pokemon_list_dto.dart';
import 'package:pokedex_flutter_async_redux/utils/typedef.dart';

part 'app_state.freezed.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    @Default(ThemeMode.system) ThemeMode savedThemeMode,
    @Default(Wait.empty) Wait wait,
    @Default(SimplePokemonListDto()) SimplePokemonListDto simplePokemonList,
    @Default(<PokemonDto>[]) PokemonList pokemonList,
    @Default(<PokemonDto>[]) PokemonList searchResultList,
    @Default(null) PokemonDto? selectedPokemon,
  }) = _AppState;
}
