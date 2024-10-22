import 'package:pokedex_flutter_async_redux/apis/api_client.dart';
import 'package:pokedex_flutter_async_redux/apis/model/simple_pokemon_list.dart';
import 'package:pokedex_flutter_async_redux/extensions/simple_pokemon_list_ext.dart';
import 'package:pokedex_flutter_async_redux/model/dto/simple_pokemon_list_dto.dart';
import 'package:pokedex_flutter_async_redux/utils/strings.dart';

class PokemonApi {
  final ApiClient apiClient;

  PokemonApi(this.apiClient);

  Future<SimplePokemonListDto> getSimplePokemonList() async {
    final baseUrl = apiClient.baseUrl;
    final response = await apiClient.dio.get<Map<String, dynamic>>('$baseUrl/pokemon');
    final simplePokemonList = SimplePokemonList.fromJson(response.data!);

    return simplePokemonList.toDto();
  }
}
