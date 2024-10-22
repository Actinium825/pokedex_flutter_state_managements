import 'package:freezed_annotation/freezed_annotation.dart';

part 'simple_pokemon.freezed.dart';
part 'simple_pokemon.g.dart';

@freezed
class SimplePokemon with _$SimplePokemon {
  const factory SimplePokemon({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'url') String? detailsUrl,
  }) = _SimplePokemon;

  factory SimplePokemon.fromJson(Map<String, dynamic> json) => _$SimplePokemonFromJson(json);
}
