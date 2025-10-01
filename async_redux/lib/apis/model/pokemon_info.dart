import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_flutter_async_redux/utils/typedef.dart';

part 'pokemon_info.freezed.dart';
part 'pokemon_info.g.dart';

@freezed
abstract class PokemonInfo with _$PokemonInfo {
  const factory PokemonInfo({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'url') String? detailsUrl,
  }) = _PokemonInfo;

  factory PokemonInfo.fromJson(Json json) => _$PokemonInfoFromJson(json);
}
