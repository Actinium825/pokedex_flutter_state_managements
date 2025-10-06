import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:getx/utils/typedef.dart';

part 'simple_pokemon.freezed.dart';
part 'simple_pokemon.g.dart';

@freezed
abstract class SimplePokemon with _$SimplePokemon {
  const factory SimplePokemon({
    @Default('') @JsonKey(name: 'name') String name,
    @Default('') @JsonKey(name: 'url') String detailsUrl,
  }) = _SimplePokemon;

  factory SimplePokemon.fromJson(Json json) => _$SimplePokemonFromJson(json);
}
