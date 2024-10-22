import 'package:pokedex_flutter_async_redux/apis/model/pokemon_sprites.dart';
import 'package:pokedex_flutter_async_redux/extensions/other_sprites_ext.dart';
import 'package:pokedex_flutter_async_redux/model/dto/other_sprites_dto.dart';
import 'package:pokedex_flutter_async_redux/model/dto/pokemon_sprites_dto.dart';

extension PokemonSpritesExt on PokemonSprites {
  PokemonSpritesDto toDto() => PokemonSpritesDto(
        frontDefaultImageUrl: frontDefaultImageUrl ?? '',
        otherSprites: otherSprites?.toDto() ?? const OtherSpritesDto(),
      );
}
