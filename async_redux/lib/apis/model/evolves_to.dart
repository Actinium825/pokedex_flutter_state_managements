import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_flutter_async_redux/apis/model/pokemon_info.dart';
import 'package:pokedex_flutter_async_redux/utils/typedef.dart';

part 'evolves_to.freezed.dart';
part 'evolves_to.g.dart';

@freezed
abstract class EvolvesTo with _$EvolvesTo {
  const factory EvolvesTo({
    @JsonKey(name: 'species') PokemonInfo? speciesInfo,
    @JsonKey(name: 'evolves_to') List<EvolvesTo>? evolutions,
  }) = _EvolvesTo;

  factory EvolvesTo.fromJson(Json json) => _$EvolvesToFromJson(json);
}
