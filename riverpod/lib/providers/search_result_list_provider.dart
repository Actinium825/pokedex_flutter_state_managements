import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_flutter_riverpod/providers/pokemon_api_provider.dart';
import 'package:pokedex_flutter_riverpod/utils/typedef.dart';

final searchResultListProvider = FutureProvider.autoDispose.family<PokemonList, String>(
    (ref, pokemonName) async => ref.read(pokemonApiProvider).searchPokemon(pokemonName: pokemonName.trim()));
