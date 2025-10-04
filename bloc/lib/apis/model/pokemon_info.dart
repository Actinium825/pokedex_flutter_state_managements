import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_flutter_bloc/utils/typedef.dart';

part 'pokemon_info.freezed.dart';
part 'pokemon_info.g.dart';

@freezed
abstract class PokemonInfo with _$PokemonInfo {
  const factory PokemonInfo({
    @Default('') @JsonKey(name: 'name') String name,
    @Default('') @JsonKey(name: 'url') String detailsUrl,
  }) = _PokemonInfo;

  factory PokemonInfo.fromJson(Json json) => _$PokemonInfoFromJson(json);
}
