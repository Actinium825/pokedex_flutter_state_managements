import 'package:getx/apis/model/pokemon_species.dart';
import 'package:getx/utils/extension.dart';
import 'package:getx/utils/strings.dart';

extension PokemonSpeciesExt on PokemonSpecies {
  String get flavorTextEnglish => flavorTextEntries
      .firstWhereForLoop((flavorText) => flavorText.languageInfo.name == english)
      .flavorText
      .replaceAll('\n', ' ')
      .replaceAll('\u000c', ' ');
}
