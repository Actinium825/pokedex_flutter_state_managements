import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_info.freezed.dart';
part 'pokemon_info.g.dart';

@freezed
class PokemonInfo with _$PokemonInfo {
  const factory PokemonInfo({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'url') String? detailsUrl,
  }) = _PokemonInfo;

  factory PokemonInfo.fromJson(Map<String, dynamic> json) => _$PokemonInfoFromJson(json);
}
