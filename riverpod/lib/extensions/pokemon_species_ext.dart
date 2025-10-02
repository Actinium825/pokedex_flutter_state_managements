import 'package:pokedex_flutter_riverpod/apis/model/pokemon_species.dart';
import 'package:pokedex_flutter_riverpod/utils/extension.dart';
import 'package:pokedex_flutter_riverpod/utils/strings.dart';

extension PokemonSpeciesExt on PokemonSpecies {
  String get flavorTextEnglish => flavorTextEntries
      .firstWhereForLoop((flavorText) => flavorText.languageInfo.name == english)
      .flavorText
      .replaceAll('\n', ' ')
      .replaceAll('\u000c', ' ');
}
