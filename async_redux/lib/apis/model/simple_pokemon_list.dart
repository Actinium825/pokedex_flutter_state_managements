import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_flutter_async_redux/apis/model/simple_pokemon.dart';
import 'package:pokedex_flutter_async_redux/utils/typedef.dart';

part 'simple_pokemon_list.freezed.dart';
part 'simple_pokemon_list.g.dart';

@freezed
abstract class SimplePokemonList with _$SimplePokemonList {
  const factory SimplePokemonList({
    @JsonKey(name: 'count') int? count,
    @JsonKey(name: 'next') String? next,
    @JsonKey(name: 'previous') String? previous,
    @JsonKey(name: 'results') List<SimplePokemon>? simplePokemonList,
  }) = _SimplePokemonList;

  factory SimplePokemonList.fromJson(Json json) => _$SimplePokemonListFromJson(json);
}
