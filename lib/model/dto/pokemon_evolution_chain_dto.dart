import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_flutter_async_redux/model/dto/evolves_to_dto.dart';

part 'pokemon_evolution_chain_dto.freezed.dart';

@freezed
abstract class PokemonEvolutionChainDto with _$PokemonEvolutionChainDto {
  const factory PokemonEvolutionChainDto({
    @Default(EvolvesToDto()) EvolvesToDto chain,
  }) = _PokemonEvolutionChainDto;
}
