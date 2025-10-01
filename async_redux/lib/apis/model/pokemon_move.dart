import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_flutter_async_redux/apis/model/pokemon_info.dart';
import 'package:pokedex_flutter_async_redux/utils/typedef.dart';

part 'pokemon_move.freezed.dart';
part 'pokemon_move.g.dart';

@freezed
abstract class PokemonMove with _$PokemonMove {
  const factory PokemonMove({
    @Default(PokemonInfo()) @JsonKey(name: 'move') PokemonInfo moveInfo,
  }) = _PokemonMove;

  factory PokemonMove.fromJson(Json json) => _$PokemonMoveFromJson(json);
}
