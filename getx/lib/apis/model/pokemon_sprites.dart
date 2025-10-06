import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:getx/apis/model/other_sprites.dart';
import 'package:getx/utils/typedef.dart';

part 'pokemon_sprites.freezed.dart';
part 'pokemon_sprites.g.dart';

@freezed
abstract class PokemonSprites with _$PokemonSprites {
  const factory PokemonSprites({
    @Default('') @JsonKey(name: 'front_default') String frontDefaultImageUrl,
    @Default(OtherSprites()) @JsonKey(name: 'other') OtherSprites otherSprites,
  }) = _PokemonSprites;

  factory PokemonSprites.fromJson(Json json) => _$PokemonSpritesFromJson(json);
}
