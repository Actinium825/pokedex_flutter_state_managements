import 'package:pokedex_flutter_async_redux/apis/model/simple_pokemon.dart';
import 'package:pokedex_flutter_async_redux/model/dto/simple_pokemon_dto.dart';

extension SimplePokemonExt on SimplePokemon {
  SimplePokemonDto toDto() => SimplePokemonDto(detailsUrl: detailsUrl ?? '');
}
