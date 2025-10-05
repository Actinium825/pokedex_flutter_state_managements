import 'package:pokedex_flutter_bloc/apis/model/pokemon_species.dart';
import 'package:pokedex_flutter_bloc/utils/extension.dart';
import 'package:pokedex_flutter_bloc/utils/strings.dart';

extension PokemonSpeciesExt on PokemonSpecies {
  String get flavorTextEnglish => flavorTextEntries
      .firstWhereForLoop((flavorText) => flavorText.languageInfo.name == english)
      .flavorText
      .replaceAll('\n', ' ')
      .replaceAll('\u000c', ' ');
}
