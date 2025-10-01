import 'package:pokedex_flutter_async_redux/apis/model/pokemon_evolution_chain.dart';
import 'package:pokedex_flutter_async_redux/extensions/evolves_to_ext.dart';
import 'package:pokedex_flutter_async_redux/model/dto/evolves_to_dto.dart';
import 'package:pokedex_flutter_async_redux/model/dto/pokemon_evolution_chain_dto.dart';
import 'package:pokedex_flutter_async_redux/utils/typedef.dart';

extension PokemonEvolutionChainExt on PokemonEvolutionChain {
  PokemonEvolutionChainDto toDto() => PokemonEvolutionChainDto(chain: chain?.toDto() ?? const EvolvesToDto());
}

extension PokemonEvolutionChainDtoExt on PokemonEvolutionChainDto {
  EvolvesToList get stage2Evolutions => chain.evolutions;

  EvolvesToList get stage3Evolutions {
    final stage3Evolutions = <EvolvesToDto>[];

    for (final stage2Evolution in stage2Evolutions) {
      for (final stage3Evolution in stage2Evolution.evolutions) {
        stage3Evolutions.add(stage3Evolution);
      }
    }

    return stage3Evolutions;
  }
}
