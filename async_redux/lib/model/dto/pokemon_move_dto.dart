import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_flutter_async_redux/model/dto/pokemon_info_dto.dart';

part 'pokemon_move_dto.freezed.dart';

@freezed
abstract class PokemonMoveDto with _$PokemonMoveDto {
  const factory PokemonMoveDto({
    @Default(PokemonInfoDto()) PokemonInfoDto moveInfo,
  }) = _PokemonMoveDto;
}
