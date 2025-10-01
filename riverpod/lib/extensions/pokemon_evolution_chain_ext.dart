import 'package:pokedex_flutter_riverpod/apis/model/evolves_to.dart';
import 'package:pokedex_flutter_riverpod/apis/model/pokemon_evolution_chain.dart';
import 'package:pokedex_flutter_riverpod/utils/typedef.dart';

extension PokemonEvolutionChainExt on PokemonEvolutionChain {
  EvolvesToList get stage2Evolutions => chain.evolutions;

  EvolvesToList get stage3Evolutions {
    final stage3Evolutions = <EvolvesTo>[];

    for (final stage2Evolution in stage2Evolutions) {
      for (final stage3Evolution in stage2Evolution.evolutions) {
        stage3Evolutions.add(stage3Evolution);
      }
    }

    return stage3Evolutions;
  }
}
