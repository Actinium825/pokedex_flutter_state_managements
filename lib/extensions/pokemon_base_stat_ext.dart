import 'package:pokedex_flutter_async_redux/apis/model/pokemon_base_stat.dart';
import 'package:pokedex_flutter_async_redux/extensions/pokemon_info_ext.dart';
import 'package:pokedex_flutter_async_redux/model/dto/pokemon_base_stat_dto.dart';
import 'package:pokedex_flutter_async_redux/model/dto/pokemon_info_dto.dart';

extension PokemonBaseStatExt on PokemonBaseStat {
  PokemonBaseStatDto toDto() => PokemonBaseStatDto(
        baseStat: baseStat ?? 0,
        statInfo: statInfo?.toDto() ?? const PokemonInfoDto(),
      );
}
