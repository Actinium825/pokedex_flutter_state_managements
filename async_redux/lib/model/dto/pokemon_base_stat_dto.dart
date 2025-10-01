import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_flutter_async_redux/model/dto/pokemon_info_dto.dart';

part 'pokemon_base_stat_dto.freezed.dart';

@freezed
abstract class PokemonBaseStatDto with _$PokemonBaseStatDto {
  const factory PokemonBaseStatDto({
    @Default(0) int baseStat,
    @Default(PokemonInfoDto()) PokemonInfoDto statInfo,
  }) = _PokemonBaseStatDto;
}
