import 'package:pokedex_flutter_riverpod/apis/model/pokemon_species.dart';
import 'package:pokedex_flutter_riverpod/providers/pokemon_api_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pokemon_species_provider.g.dart';

@riverpod
class PokemonSpeciesRef extends _$PokemonSpeciesRef {
  @override
  PokemonSpecies build() => const PokemonSpecies();

  Future<void> getSpecies({required String speciesUrl}) async {
    final species = await ref.read(pokemonApiProvider).getSpecies(speciesUrl: speciesUrl);
    state = species;
  }
}
