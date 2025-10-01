import 'package:pokedex_flutter_async_redux/apis/model/pokemon_species.dart';
import 'package:pokedex_flutter_async_redux/utils/strings.dart';

extension PokemonSpeciesExt on PokemonSpecies {
  String get flavorTextEnglish => flavorTextEntries
      .firstWhere((flavorText) => flavorText.languageInfo.name == english)
      .flavorText
      .replaceAll('\n', ' ')
      .replaceAll('\u000c', ' ');
}
