import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_flutter_async_redux/apis/model/pokemon_info.dart';
import 'package:pokedex_flutter_async_redux/utils/typedef.dart';

part 'pokemon_ability.freezed.dart';
part 'pokemon_ability.g.dart';

@freezed
abstract class PokemonAbility with _$PokemonAbility {
  const factory PokemonAbility({
    @JsonKey(name: 'ability') PokemonInfo? abilityInfo,
  }) = _PokemonAbility;

  factory PokemonAbility.fromJson(Json json) => _$PokemonAbilityFromJson(json);
}
