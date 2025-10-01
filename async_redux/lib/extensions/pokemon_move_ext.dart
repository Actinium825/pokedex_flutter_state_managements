import 'package:pokedex_flutter_async_redux/apis/model/pokemon_move.dart';
import 'package:pokedex_flutter_async_redux/extensions/pokemon_info_ext.dart';
import 'package:pokedex_flutter_async_redux/model/dto/pokemon_info_dto.dart';
import 'package:pokedex_flutter_async_redux/model/dto/pokemon_move_dto.dart';

extension PokemonMoveExt on PokemonMove {
  PokemonMoveDto toDto() => PokemonMoveDto(moveInfo: moveInfo?.toDto() ?? const PokemonInfoDto());
}
