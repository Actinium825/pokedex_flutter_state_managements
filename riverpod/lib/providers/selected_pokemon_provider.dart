import 'package:flutter_riverpod/legacy.dart';
import 'package:pokedex_flutter_riverpod/apis/model/pokemon.dart';

final selectedPokemonProvider = StateProvider.autoDispose((_) => const Pokemon());
