import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_flutter_bloc/apis/model/pokemon_ability.dart';
import 'package:pokedex_flutter_bloc/apis/model/pokemon_base_stat.dart';
import 'package:pokedex_flutter_bloc/apis/model/pokemon_info.dart';
import 'package:pokedex_flutter_bloc/apis/model/pokemon_move.dart';
import 'package:pokedex_flutter_bloc/apis/model/pokemon_sprites.dart';
import 'package:pokedex_flutter_bloc/apis/model/pokemon_type.dart';
import 'package:pokedex_flutter_bloc/utils/typedef.dart';

part 'pokemon.freezed.dart';
part 'pokemon.g.dart';

@freezed
abstract class Pokemon with _$Pokemon {
  const factory Pokemon({
    @Default(0) @JsonKey(name: 'id') int id,
    @Default('') @JsonKey(name: 'name') String name,
    @Default(PokemonSprites()) @JsonKey(name: 'sprites') PokemonSprites sprites,
    @Default(<PokemonType>[]) @JsonKey(name: 'types') List<PokemonType> typeList,
    @Default(<PokemonAbility>[]) @JsonKey(name: 'abilities') List<PokemonAbility> abilityList,
    @Default(0) @JsonKey(name: 'height') int heightInDecimeters,
    @Default(0) @JsonKey(name: 'weight') int weightInDecimeters,
    @Default(0) @JsonKey(name: 'base_experience') int baseExperience,
    @Default(<PokemonBaseStat>[]) @JsonKey(name: 'stats') List<PokemonBaseStat> baseStatList,
    @Default(PokemonInfo()) @JsonKey(name: 'species') PokemonInfo speciesInfo,
    @Default(<PokemonMove>[]) @JsonKey(name: 'moves') List<PokemonMove> moveList,
  }) = _Pokemon;

  factory Pokemon.fromJson(Json json) => _$PokemonFromJson(json);
}
