import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_flutter_async_redux/apis/model/pokemon.dart';
import 'package:pokedex_flutter_async_redux/apis/model/pokemon_evolution_chain.dart';
import 'package:pokedex_flutter_async_redux/apis/model/pokemon_species.dart';
import 'package:pokedex_flutter_async_redux/apis/model/simple_pokemon_list.dart';
import 'package:pokedex_flutter_async_redux/utils/typedef.dart';

part 'app_state.freezed.dart';

@freezed
abstract class AppState with _$AppState {
  const factory AppState({
    @Default(ThemeMode.system) ThemeMode savedThemeMode,
    @Default(Wait.empty) Wait wait,
    @Default(SimplePokemonList()) SimplePokemonList simplePokemonList,
    @Default(<Pokemon>[]) PokemonList pokemonList,
    @Default(<Pokemon>[]) PokemonList searchResultList,
    @Default(null) Pokemon? selectedPokemon,
    @Default(null) PokemonSpecies? pokemonSpecies,
    @Default(null) PokemonEvolutionChain? pokemonEvolutionChain,
    @Default(<Pokemon>[]) PokemonList pokemonEvolutionList,
  }) = _AppState;
}
