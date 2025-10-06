import 'package:get/get.dart';
import 'package:getx/apis/model/pokemon.dart';
import 'package:getx/apis/model/pokemon_evolution_chain.dart';
import 'package:getx/apis/model/pokemon_species.dart';
import 'package:getx/apis/model/simple_pokemon.dart';
import 'package:getx/apis/model/simple_pokemon_list.dart';
import 'package:getx/extensions/evolves_to_ext.dart';
import 'package:getx/extensions/pokemon_evolution_chain_ext.dart';
import 'package:getx/utils/extension.dart';
import 'package:getx/utils/strings.dart';
import 'package:getx/utils/typedef.dart';

class PokemonApi extends GetConnect {
  Future<SimplePokemonList> getSimplePokemonList({String? nextPageUrl}) async {
    final fetchUrl = nextPageUrl ?? '$pokeApiBaseUrl/pokemon';
    final response = await get<Json>(fetchUrl);
    final simplePokemonList = SimplePokemonList.fromJson(response.body!);

    return simplePokemonList;
  }

  Future<PokemonList> getPokemonList({required List<SimplePokemon> simplePokemonList}) async {
    final futures = simplePokemonList.forLoop((simplePokemon) {
      final url = simplePokemon.detailsUrl;
      final response = get<Json>(url);
      return response;
    });

    final responses = await Future.wait(futures);

    return responses.forLoop((response) => Pokemon.fromJson(response.body!));
  }

  Future<PokemonList> searchPokemon({required String pokemonName}) async {
    final fetchUrl = '$pokeApiBaseUrl/pokemon/$pokemonName';

    try {
      final response = await get<Json>(fetchUrl);
      final pokemon = Pokemon.fromJson(response.body!);

      return [pokemon];
    } catch (_) {
      return List.empty();
    }
  }

  Future<PokemonSpecies> getSpecies({required String speciesUrl}) async {
    final response = await get<Json>(speciesUrl);
    final pokemonSpecies = PokemonSpecies.fromJson(response.body!);

    return pokemonSpecies;
  }

  Future<PokemonEvolutionChain> getEvolutionChain({required String evolutionChainUrl}) async {
    final response = await get<Json>(evolutionChainUrl);
    final evolutionChain = PokemonEvolutionChain.fromJson(response.body!);

    return evolutionChain;
  }

  Future<PokemonList> getEvolutionList({required PokemonEvolutionChain evolutionChain}) async {
    const baseUrl = '$pokeApiBaseUrl/pokemon';

    final stage2EvolutionsFutures = evolutionChain.stage2Evolutions.forLoop((stage2Evolution) {
      final fetchUrl = '$baseUrl/${stage2Evolution.speciesName}';
      return get<Json>(fetchUrl);
    });

    final stage3EvolutionFutures = evolutionChain.stage3Evolutions.forLoop((stage3Evolution) {
      final fetchUrl = '$baseUrl/${stage3Evolution.speciesName}';
      return get<Json>(fetchUrl);
    });

    final responses = await Future.wait([
      get<Json>('$baseUrl/${evolutionChain.chain.speciesName}'),
      ...stage2EvolutionsFutures,
      ...stage3EvolutionFutures,
    ]);

    final pokemon = Pokemon.fromJson(responses.first.body!);
    final stage2Evolutions = responses.sublist(1).forLoop((stage2Evolution) => Pokemon.fromJson(stage2Evolution.body!));
    final stage3Evolutions = responses
        .sublist(1 + stage2Evolutions.length)
        .forLoop((stage3Evolution) => Pokemon.fromJson(stage3Evolution.body!));

    return [pokemon, ...stage2Evolutions, ...stage3Evolutions];
  }
}
