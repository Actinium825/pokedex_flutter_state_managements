import 'package:pokedex_flutter_async_redux/apis/model/other_sprites.dart';
import 'package:pokedex_flutter_async_redux/extensions/official_artwork_ext.dart';
import 'package:pokedex_flutter_async_redux/model/dto/official_artwork_dto.dart';
import 'package:pokedex_flutter_async_redux/model/dto/other_sprites_dto.dart';

extension OtherSpritesExt on OtherSprites {
  OtherSpritesDto toDto() => OtherSpritesDto(officialArtwork: officialArtwork?.toDto() ?? const OfficialArtworkDto());
}
