import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_flutter_async_redux/apis/model/pokemon_info.dart';

part 'pokemon_type.freezed.dart';
part 'pokemon_type.g.dart';

@freezed
class PokemonType with _$PokemonType {
  const factory PokemonType({
    @JsonKey(name: 'slot') int? slot,
    @JsonKey(name: 'type') PokemonInfo? typeInfo,
  }) = _PokemonType;

  factory PokemonType.fromJson(Map<String, dynamic> json) => _$PokemonTypeFromJson(json);
}
