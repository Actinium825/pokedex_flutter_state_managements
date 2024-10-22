import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_flutter_async_redux/model/dto/other_sprites_dto.dart';

part 'pokemon_sprites_dto.freezed.dart';

@freezed
class PokemonSpritesDto with _$PokemonSpritesDto {
  const factory PokemonSpritesDto({
    @Default('') String frontDefaultImageUrl,
    @Default(OtherSpritesDto()) OtherSpritesDto otherSprites,
  }) = _PokemonSpritesDto;
}
