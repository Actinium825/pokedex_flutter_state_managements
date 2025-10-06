import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:getx/apis/model/evolves_to.dart';
import 'package:getx/utils/typedef.dart';

part 'pokemon_evolution_chain.freezed.dart';
part 'pokemon_evolution_chain.g.dart';

@freezed
abstract class PokemonEvolutionChain with _$PokemonEvolutionChain {
  const factory PokemonEvolutionChain({
    @Default(EvolvesTo()) @JsonKey(name: 'chain') EvolvesTo chain,
  }) = _PokemonEvolutionChain;

  factory PokemonEvolutionChain.fromJson(Json json) => _$PokemonEvolutionChainFromJson(json);
}
