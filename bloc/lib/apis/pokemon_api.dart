import 'package:pokedex_flutter_bloc/apis/api_client.dart';
import 'package:pokedex_flutter_bloc/apis/model/simple_pokemon_list.dart';
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
}
