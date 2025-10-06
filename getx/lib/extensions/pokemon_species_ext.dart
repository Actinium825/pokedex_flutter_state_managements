import 'package:pokedex_getx/apis/model/pokemon_species.dart';
import 'package:pokedex_getx/utils/extension.dart';
import 'package:pokedex_getx/utils/strings.dart';

extension PokemonSpeciesExt on PokemonSpecies {
  String get flavorTextEnglish => flavorTextEntries
      .firstWhereForLoop((flavorText) => flavorText.languageInfo.name == english)
      .flavorText
      .replaceAll('\n', ' ')
      .replaceAll('\u000c', ' ');
}
