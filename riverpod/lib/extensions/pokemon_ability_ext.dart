import 'package:pokedex_flutter_riverpod/apis/model/pokemon_ability.dart';

extension PokemonAbilityExt on PokemonAbility {
  String get name => abilityInfo.name;
}
