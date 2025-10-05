import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_flutter_bloc/apis/model/evolves_to.dart';
import 'package:pokedex_flutter_bloc/utils/typedef.dart';

part 'pokemon_evolution_chain.freezed.dart';
part 'pokemon_evolution_chain.g.dart';

@freezed
abstract class PokemonEvolutionChain with _$PokemonEvolutionChain {
  const factory PokemonEvolutionChain({
    @Default(EvolvesTo()) @JsonKey(name: 'chain') EvolvesTo chain,
  }) = _PokemonEvolutionChain;

  factory PokemonEvolutionChain.fromJson(Json json) => _$PokemonEvolutionChainFromJson(json);
}
