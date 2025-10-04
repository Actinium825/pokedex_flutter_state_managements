import 'package:pokedex_flutter_bloc/apis/api_client.dart';
import 'package:pokedex_flutter_bloc/apis/model/pokemon.dart';
import 'package:pokedex_flutter_bloc/apis/model/simple_pokemon.dart';
import 'package:pokedex_flutter_bloc/apis/model/simple_pokemon_list.dart';
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
}
