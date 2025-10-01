import 'package:pokedex_flutter_riverpod/apis/model/pokemon_evolution_chain.dart';
import 'package:pokedex_flutter_riverpod/providers/pokemon_api_provider.dart';
import 'package:pokedex_flutter_riverpod/providers/pokemon_species_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pokemon_evolution_chain_provider.g.dart';

@riverpod
class PokemonEvolutionChainRef extends _$PokemonEvolutionChainRef {
  @override
  PokemonEvolutionChain build() => const PokemonEvolutionChain();

  Future<void> getEvolutionChain() async {
    final pokemonSpecies = ref.read(pokemonSpeciesRefProvider);
    final evolutionChainUrl = pokemonSpecies.evolutionChainInfo.url;
    final evolutionChain = await ref.read(pokemonApiProvider).getEvolutionChain(evolutionChainUrl: evolutionChainUrl);

    state = evolutionChain;
  }
}
