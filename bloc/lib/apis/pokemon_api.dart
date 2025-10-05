import 'package:dio/dio.dart';
import 'package:pokedex_flutter_bloc/apis/api_client.dart';
import 'package:pokedex_flutter_bloc/apis/model/pokemon.dart';
import 'package:pokedex_flutter_bloc/apis/model/pokemon_evolution_chain.dart';
import 'package:pokedex_flutter_bloc/apis/model/pokemon_species.dart';
import 'package:pokedex_flutter_bloc/apis/model/simple_pokemon.dart';
import 'package:pokedex_flutter_bloc/apis/model/simple_pokemon_list.dart';
import 'package:pokedex_flutter_bloc/extensions/evolves_to_ext.dart';
import 'package:pokedex_flutter_bloc/extensions/pokemon_evolution_chain_ext.dart';
import 'package:pokedex_flutter_bloc/utils/extension.dart';
import 'package:pokedex_flutter_bloc/utils/typedef.dart';

class PokemonApi {
  final ApiClient apiClient;

  PokemonApi(this.apiClient);

  Future<SimplePokemonList> getSimplePokemonList({String? nextPageUrl}) async {
    final fetchUrl = nextPageUrl ?? '${apiClient.baseUrl}/pokemon';
    final response = await apiClient.dio.get<Json>(fetchUrl);
    final simplePokemonList = SimplePokemonList.fromJson(response.data!);

    return simplePokemonList;
  }

  Future<PokemonList> getPokemonList({required List<SimplePokemon> simplePokemonList}) async {
    final dio = apiClient.dio;

    final futures = simplePokemonList.forLoop((simplePokemon) {
      final url = simplePokemon.detailsUrl;
      final response = dio.get<Json>(url);
      return response;
    });

    final responses = await Future.wait(futures);

    return responses.forLoop((response) => Pokemon.fromJson(response.data!));
  }

  Future<PokemonList> searchPokemon({required String pokemonName}) async {
    final baseUrl = apiClient.baseUrl;
    final fetchUrl = '$baseUrl/pokemon/$pokemonName';

    try {
      final response = await apiClient.dio.get<Json>(fetchUrl);
      final pokemon = Pokemon.fromJson(response.data!);

      return [pokemon];
    } on DioException catch (_) {
      return List.empty();
    }
  }

  Future<PokemonSpecies> getSpecies({required String speciesUrl}) async {
    final response = await apiClient.dio.get<Json>(speciesUrl);
    final pokemonSpecies = PokemonSpecies.fromJson(response.data!);

    return pokemonSpecies;
  }

  Future<PokemonEvolutionChain> getEvolutionChain({required String evolutionChainUrl}) async {
    final response = await apiClient.dio.get<Json>(evolutionChainUrl);
    final evolutionChain = PokemonEvolutionChain.fromJson(response.data!);

    return evolutionChain;
  }

  Future<PokemonList> getEvolutionList({required PokemonEvolutionChain evolutionChain}) async {
    final dio = apiClient.dio;
    final baseUrl = '${apiClient.baseUrl}/pokemon';

    final stage2EvolutionsFutures = evolutionChain.stage2Evolutions.forLoop((stage2Evolution) {
      final fetchUrl = '$baseUrl/${stage2Evolution.speciesName}';
      return dio.get<Json>(fetchUrl);
    });

    final stage3EvolutionFutures = evolutionChain.stage3Evolutions.forLoop((stage3Evolution) {
      final fetchUrl = '$baseUrl/${stage3Evolution.speciesName}';
      return dio.get<Json>(fetchUrl);
    });

    final responses = await Future.wait([
      dio.get<Json>('$baseUrl/${evolutionChain.chain.speciesName}'),
      ...stage2EvolutionsFutures,
      ...stage3EvolutionFutures,
    ]);

    final pokemon = Pokemon.fromJson(responses.first.data!);
    final stage2Evolutions = responses.sublist(1).forLoop((stage2Evolution) => Pokemon.fromJson(stage2Evolution.data!));
    final stage3Evolutions = responses
        .sublist(1 + stage2Evolutions.length)
        .forLoop((stage3Evolution) => Pokemon.fromJson(stage3Evolution.data!));

    return [pokemon, ...stage2Evolutions, ...stage3Evolutions];
  }
}
