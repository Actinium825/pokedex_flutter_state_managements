import 'package:pokedex_flutter_async_redux/apis/model/pokemon.dart';
import 'package:pokedex_flutter_async_redux/extensions/pokemon_info_ext.dart';
import 'package:pokedex_flutter_async_redux/extensions/pokemon_ability_ext.dart';
import 'package:pokedex_flutter_async_redux/extensions/pokemon_base_stat_ext.dart';
import 'package:pokedex_flutter_async_redux/extensions/pokemon_move_ext.dart';
import 'package:pokedex_flutter_async_redux/extensions/pokemon_sprites_ext.dart';
import 'package:pokedex_flutter_async_redux/extensions/pokemon_type_ext.dart';
import 'package:pokedex_flutter_async_redux/model/dto/pokemon_info_dto.dart';
import 'package:pokedex_flutter_async_redux/model/dto/pokemon_dto.dart';
import 'package:pokedex_flutter_async_redux/model/dto/pokemon_sprites_dto.dart';

extension PokemonExt on Pokemon {
  PokemonDto toDto() => PokemonDto(
        name: name ?? '',
        abilityList: [...?abilityList?.map((ability) => ability.toDto())],
        baseExperience: baseExperience ?? 0,
        baseStatList: [...?baseStatList?.map((baseStat) => baseStat.toDto())],
        heightInDecimeters: heightInDecimeters ?? 0,
        id: id ?? 0,
        moveList: [...?moveList?.map((move) => move.toDto())],
        speciesInfo: speciesInfo?.toDto() ?? const PokemonInfoDto(),
        sprites: sprites?.toDto() ?? const PokemonSpritesDto(),
        typeList: [...?typeList?.map((type) => type.toDto())],
        weightInDecimeters: weightInDecimeters ?? 0,
      );
}

extension PokemonDtoExt on PokemonDto {
  String get imageUrl => sprites.otherSprites.officialArtwork.imageUrl;
}
