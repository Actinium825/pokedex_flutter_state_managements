import 'package:pokedex_flutter_async_redux/apis/model/pokemon_type.dart';
import 'package:pokedex_flutter_async_redux/extensions/pokemon_info_ext.dart';
import 'package:pokedex_flutter_async_redux/model/dto/pokemon_info_dto.dart';
import 'package:pokedex_flutter_async_redux/model/dto/pokemon_type_dto.dart';

extension PokemonTypeExt on PokemonType {
  PokemonTypeDto toDto() => PokemonTypeDto(
        slot: slot ?? 0,
        typeInfo: typeInfo?.toDto() ?? const PokemonInfoDto(),
      );
}
