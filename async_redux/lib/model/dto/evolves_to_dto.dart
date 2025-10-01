import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_flutter_async_redux/model/dto/pokemon_info_dto.dart';
import 'package:pokedex_flutter_async_redux/utils/typedef.dart';

part 'evolves_to_dto.freezed.dart';

@freezed
abstract class EvolvesToDto with _$EvolvesToDto {
  const factory EvolvesToDto({
    @Default(PokemonInfoDto()) PokemonInfoDto speciesInfo,
    @Default(<EvolvesToDto>[]) EvolvesToList evolutions,
  }) = _EvolvesToDto;
}
