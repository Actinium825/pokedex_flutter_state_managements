import 'package:dio/dio.dart';
import 'package:pokedex_flutter_async_redux/apis/api_client.dart';
import 'package:pokedex_flutter_async_redux/apis/model/pokemon.dart';
import 'package:pokedex_flutter_async_redux/apis/model/pokemon_evolution_chain.dart';
import 'package:pokedex_flutter_async_redux/apis/model/pokemon_species.dart';
import 'package:pokedex_flutter_async_redux/apis/model/simple_pokemon_list.dart';
import 'package:pokedex_flutter_async_redux/extensions/evolves_to_ext.dart';
import 'package:pokedex_flutter_async_redux/extensions/pokemon_evolution_chain_ext.dart';
import 'package:pokedex_flutter_async_redux/extensions/pokemon_ext.dart';
import 'package:pokedex_flutter_async_redux/extensions/pokemon_species_ext.dart';
import 'package:pokedex_flutter_async_redux/extensions/simple_pokemon_list_ext.dart';
import 'package:pokedex_flutter_async_redux/model/dto/pokemon_dto.dart';
import 'package:pokedex_flutter_async_redux/model/dto/pokemon_evolution_chain_dto.dart';
import 'package:pokedex_flutter_async_redux/model/dto/pokemon_species_dto.dart';
import 'package:pokedex_flutter_async_redux/model/dto/simple_pokemon_dto.dart';
import 'package:pokedex_flutter_async_redux/model/dto/simple_pokemon_list_dto.dart';
import 'package:pokedex_flutter_async_redux/utils/typedef.dart';

class PokemonApi {
  final ApiClient apiClient;

  PokemonApi(this.apiClient);

  Future<SimplePokemonListDto> getSimplePokemonList({String? nextPageUrl}) async {
    final fetchUrl = nextPageUrl ?? '${apiClient.baseUrl}/pokemon';
    final response = await apiClient.dio.get<Json>(fetchUrl);
    final simplePokemonList = SimplePokemonList.fromJson(response.data!);

    return simplePokemonList.toDto();
  }

  Future<PokemonList> getPokemonList({required List<SimplePokemonDto> simplePokemonList}) async {
    final dio = apiClient.dio;

    final futures = simplePokemonList.map((simplePokemon) {
      final url = simplePokemon.detailsUrl;
      final response = dio.get<Json>(url);
      return response;
    });

    final responses = await Future.wait(futures);

    return responses.map((response) => Pokemon.fromJson(response.data!).toDto()).toList();
  }

  Future<PokemonList> searchPokemon({required String pokemonName}) async {
    final baseUrl = apiClient.baseUrl;
    final fetchUrl = '$baseUrl/pokemon/$pokemonName';

    try {
      final response = await apiClient.dio.get<Json>(fetchUrl);
      final pokemon = Pokemon.fromJson(response.data!);

      return [pokemon.toDto()];
    } on DioException catch (_) {
      return List.empty();
    }
  }

  Future<PokemonSpeciesDto> getSpecies({required String speciesUrl}) async {
    final response = await apiClient.dio.get<Json>(speciesUrl);
    final pokemonSpecies = PokemonSpecies.fromJson(response.data!);

    return pokemonSpecies.toDto();
  }

  Future<PokemonEvolutionChainDto> getEvolutionChain({required String evolutionChainUrl}) async {
    final response = await apiClient.dio.get<Json>(evolutionChainUrl);
    final evolutionChain = PokemonEvolutionChain.fromJson(response.data!);

    return evolutionChain.toDto();
  }

  Future<PokemonList> getEvolutionList({required PokemonEvolutionChainDto evolutionChain}) async {
    final futures = <Future<Response<Json>>>[];
    final dio = apiClient.dio;
    final baseUrl = '${apiClient.baseUrl}/pokemon';

    String fetchUrl = '$baseUrl/${evolutionChain.chain.speciesName}';
    futures.add(dio.get(fetchUrl));

    for (final stage2Evolution in evolutionChain.stage2Evolutions) {
      fetchUrl = '$baseUrl/${stage2Evolution.speciesName}';
      futures.add(dio.get(fetchUrl));
    }

    for (final stage3Evolution in evolutionChain.stage3Evolutions) {
      fetchUrl = '$baseUrl/${stage3Evolution.speciesName}';
      futures.add(dio.get(fetchUrl));
    }

    final responses = await Future.wait(futures);
    final evolutionList = <PokemonDto>[];
    final pokemon = Pokemon.fromJson(responses.first.data!);

    evolutionList.add(pokemon.toDto());

    for (final stage2Evolution in responses.sublist(1)) {
      final pokemon = Pokemon.fromJson(stage2Evolution.data!);
      evolutionList.add(pokemon.toDto());
    }

    for (final stage3Evolution in responses.sublist(evolutionList.length)) {
      final pokemon = Pokemon.fromJson(stage3Evolution.data!);
      evolutionList.add(pokemon.toDto());
    }

    return evolutionList;
  }
}
