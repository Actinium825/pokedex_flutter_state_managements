import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:getx/apis/model/pokemon_info.dart';
import 'package:getx/utils/typedef.dart';

part 'pokemon_base_stat.freezed.dart';
part 'pokemon_base_stat.g.dart';

@freezed
abstract class PokemonBaseStat with _$PokemonBaseStat {
  const factory PokemonBaseStat({
    @Default(0) @JsonKey(name: 'base_stat') int baseStat,
    @Default(PokemonInfo()) @JsonKey(name: 'stat') PokemonInfo statInfo,
  }) = _PokemonBaseStat;

  factory PokemonBaseStat.fromJson(Json json) => _$PokemonBaseStatFromJson(json);
}
