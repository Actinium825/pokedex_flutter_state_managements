import 'package:get/get.dart';
import 'package:getx/apis/model/pokemon.dart';
import 'package:getx/apis/model/pokemon_species.dart';
import 'package:getx/apis/model/simple_pokemon.dart';
import 'package:getx/apis/model/simple_pokemon_list.dart';
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
}
