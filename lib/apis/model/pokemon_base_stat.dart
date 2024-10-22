import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_flutter_async_redux/apis/model/pokemon_info.dart';

part 'pokemon_base_stat.freezed.dart';
part 'pokemon_base_stat.g.dart';

@freezed
class PokemonBaseStat with _$PokemonBaseStat {
  const factory PokemonBaseStat({
    @JsonKey(name: 'base_stat') int? baseStat,
    @JsonKey(name: 'stat') PokemonInfo? statInfo,
  }) = _PokemonBaseStat;

  factory PokemonBaseStat.fromJson(Map<String, dynamic> json) => _$PokemonBaseStatFromJson(json);
}
