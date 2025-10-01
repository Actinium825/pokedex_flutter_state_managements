import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_flutter_async_redux/apis/model/official_artwork.dart';
import 'package:pokedex_flutter_async_redux/utils/typedef.dart';

part 'other_sprites.freezed.dart';
part 'other_sprites.g.dart';

@freezed
abstract class OtherSprites with _$OtherSprites {
  const factory OtherSprites({
    @JsonKey(name: 'official-artwork') OfficialArtwork? officialArtwork,
  }) = _OtherSprites;

  factory OtherSprites.fromJson(Json json) => _$OtherSpritesFromJson(json);
}
