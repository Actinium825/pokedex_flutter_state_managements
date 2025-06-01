import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_flutter_async_redux/model/dto/official_artwork_dto.dart';

part 'other_sprites_dto.freezed.dart';

@freezed
abstract class OtherSpritesDto with _$OtherSpritesDto {
  const factory OtherSpritesDto({
    @Default(OfficialArtworkDto()) OfficialArtworkDto officialArtwork,
  }) = _OtherSpritesDto;
}
