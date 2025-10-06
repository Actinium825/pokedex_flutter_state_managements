import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:getx/apis/model/simple_pokemon.dart';
import 'package:getx/utils/typedef.dart';

part 'simple_pokemon_list.freezed.dart';
part 'simple_pokemon_list.g.dart';

@freezed
abstract class SimplePokemonList with _$SimplePokemonList {
  const factory SimplePokemonList({
    @Default(0) @JsonKey(name: 'count') int count,
    @Default('') @JsonKey(name: 'next') String next,
    @Default('') @JsonKey(name: 'previous') String previous,
    @Default(<SimplePokemon>[]) @JsonKey(name: 'results') List<SimplePokemon> simplePokemonList,
  }) = _SimplePokemonList;

  factory SimplePokemonList.fromJson(Json json) => _$SimplePokemonListFromJson(json);
}
