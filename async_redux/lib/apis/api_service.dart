import 'package:pokedex_flutter_async_redux/apis/api_client.dart';
import 'package:pokedex_flutter_async_redux/apis/pokemon_api.dart';
import 'package:pokedex_flutter_async_redux/utils/strings.dart';

class ApiService {
  static final _apiClient = ApiClient(baseUrl);

  static PokemonApi get pokemonApi => PokemonApi(_apiClient);
}
