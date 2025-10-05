import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_flutter_bloc/apis/model/pokemon.dart';
import 'package:pokedex_flutter_bloc/apis/model/pokemon_evolution_chain.dart';
import 'package:pokedex_flutter_bloc/apis/model/pokemon_species.dart';
import 'package:pokedex_flutter_bloc/utils/typedef.dart';

part 'pokemon_info_state.freezed.dart';

@freezed
abstract class PokemonInfoState with _$PokemonInfoState {
  const factory PokemonInfoState({
    @Default(PokemonSpecies()) PokemonSpecies pokemonSpecies,
    @Default(PokemonEvolutionChain()) PokemonEvolutionChain pokemonEvolutionChain,
    @Default(<Pokemon>[]) PokemonList pokemonEvolutionList,
    @Default(false) bool isLoading,
  }) = _PokemonInfoState;
}
