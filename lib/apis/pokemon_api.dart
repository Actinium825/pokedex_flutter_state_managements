import 'package:dio/dio.dart';
import 'package:pokedex_flutter_async_redux/apis/api_client.dart';
import 'package:pokedex_flutter_async_redux/apis/model/pokemon.dart';
import 'package:pokedex_flutter_async_redux/apis/model/pokemon_species.dart';
import 'package:pokedex_flutter_async_redux/apis/model/simple_pokemon_list.dart';
import 'package:pokedex_flutter_async_redux/extensions/pokemon_ext.dart';
import 'package:pokedex_flutter_async_redux/extensions/pokemon_species_ext.dart';
import 'package:pokedex_flutter_async_redux/extensions/simple_pokemon_list_ext.dart';
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

  Future<PokemonList> getPokemonList(List<SimplePokemonDto> simplePokemonList) async {
    final dio = apiClient.dio;

    final futures = simplePokemonList.map((simplePokemon) {
      final url = simplePokemon.detailsUrl;
      final response = dio.get<Json>(url);
      return response;
    });

    final responses = await Future.wait(futures);

    return responses.map((response) => Pokemon.fromJson(response.data!).toDto()).toList();
  }

  Future<PokemonList> searchPokemon(String pokemonName) async {
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

  Future<PokemonSpeciesDto> getPokemonSpecies(String speciesUrl) async {
    final response = await apiClient.dio.get<Json>(speciesUrl);
    final pokemonSpecies = PokemonSpecies.fromJson(response.data!);

    return pokemonSpecies.toDto();
  }
}
