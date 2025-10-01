import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_flutter_async_redux/apis/model/evolves_to.dart';
import 'package:pokedex_flutter_async_redux/utils/typedef.dart';

part 'pokemon_evolution_chain.freezed.dart';
part 'pokemon_evolution_chain.g.dart';

@freezed
abstract class PokemonEvolutionChain with _$PokemonEvolutionChain {
  const factory PokemonEvolutionChain({
    @JsonKey(name: 'chain') EvolvesTo? chain,
  }) = _PokemonEvolutionChain;

  factory PokemonEvolutionChain.fromJson(Json json) => _$PokemonEvolutionChainFromJson(json);
}
