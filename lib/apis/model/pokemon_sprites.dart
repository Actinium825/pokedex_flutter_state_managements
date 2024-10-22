import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_flutter_async_redux/apis/model/other_sprites.dart';

part 'pokemon_sprites.freezed.dart';
part 'pokemon_sprites.g.dart';

@freezed
class PokemonSprites with _$PokemonSprites {
  const factory PokemonSprites({
    @JsonKey(name: 'front_default') String? frontDefaultImageUrl,
    @JsonKey(name: 'other') OtherSprites? otherSprites,
  }) = _PokemonSprites;

  factory PokemonSprites.fromJson(Map<String, dynamic> json) => _$PokemonSpritesFromJson(json);
}
