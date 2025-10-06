import 'package:getx/apis/model/evolves_to.dart';
import 'package:getx/apis/model/pokemon_evolution_chain.dart';
import 'package:getx/utils/extension.dart';
import 'package:getx/utils/typedef.dart';

extension PokemonEvolutionChainExt on PokemonEvolutionChain {
  EvolvesToList get stage2Evolutions => chain.evolutions;

  EvolvesToList get stage3Evolutions {
    final stage3Evolutions = <EvolvesTo>[];
    stage2Evolutions.forLoop((stage2Evolution) {
      stage2Evolution.evolutions.forLoop(stage3Evolutions.add);
    });
    return stage3Evolutions;
  }
}
