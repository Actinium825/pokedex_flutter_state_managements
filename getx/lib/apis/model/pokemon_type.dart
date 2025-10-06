import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:getx/apis/model/pokemon_info.dart';
import 'package:getx/utils/typedef.dart';

part 'pokemon_type.freezed.dart';
part 'pokemon_type.g.dart';

@freezed
abstract class PokemonType with _$PokemonType {
  const factory PokemonType({
    @Default(0) @JsonKey(name: 'slot') int slot,
    @Default(PokemonInfo()) @JsonKey(name: 'type') PokemonInfo typeInfo,
  }) = _PokemonType;

  factory PokemonType.fromJson(Json json) => _$PokemonTypeFromJson(json);
}
