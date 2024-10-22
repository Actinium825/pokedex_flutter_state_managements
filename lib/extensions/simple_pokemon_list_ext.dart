import 'package:pokedex_flutter_async_redux/apis/model/simple_pokemon_list.dart';
import 'package:pokedex_flutter_async_redux/extensions/simple_pokemon_ext.dart';
import 'package:pokedex_flutter_async_redux/model/dto/simple_pokemon_list_dto.dart';

extension SimplePokemonListExt on SimplePokemonList {
  SimplePokemonListDto toDto() => SimplePokemonListDto(
        next: next ?? '',
        simplePokemonList: [...?simplePokemonList?.map((simplePokemonList) => simplePokemonList.toDto())],
      );
}
