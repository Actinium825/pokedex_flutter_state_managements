import 'package:pokedex_flutter_bloc/apis/api_client.dart';
import 'package:pokedex_flutter_bloc/apis/pokemon_api.dart';
import 'package:pokedex_flutter_bloc/utils/strings.dart';

class ApiService {
  static final _apiClient = ApiClient(baseUrl);

  static var pokemonApi = PokemonApi(_apiClient);
}
