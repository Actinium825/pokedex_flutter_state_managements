import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_flutter_async_redux/model/dto/pokemon_info_dto.dart';

part 'pokemon_ability_dto.freezed.dart';

@freezed
abstract class PokemonAbilityDto with _$PokemonAbilityDto {
  const factory PokemonAbilityDto({
    @Default(PokemonInfoDto()) PokemonInfoDto abilityInfo,
  }) = _PokemonAbilityDto;
}
