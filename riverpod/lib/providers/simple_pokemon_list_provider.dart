import 'package:pokedex_flutter_riverpod/apis/model/simple_pokemon_list.dart';
import 'package:pokedex_flutter_riverpod/providers/pokemon_api_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'simple_pokemon_list_provider.g.dart';

@riverpod
class SimplePokemonListRef extends _$SimplePokemonListRef {
  @override
  SimplePokemonList build() => const SimplePokemonList();

  Future<void> getSimplePokemonList({String? nextPageUrl}) async {
    final simplePokemonList = await ref.read(pokemonApiProvider).getSimplePokemonList(nextPageUrl: nextPageUrl);
    state = simplePokemonList;
  }
}
