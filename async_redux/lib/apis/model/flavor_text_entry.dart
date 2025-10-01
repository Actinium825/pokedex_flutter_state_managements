import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_flutter_async_redux/apis/model/pokemon_info.dart';
import 'package:pokedex_flutter_async_redux/utils/typedef.dart';

part 'flavor_text_entry.freezed.dart';
part 'flavor_text_entry.g.dart';

@freezed
abstract class FlavorTextEntry with _$FlavorTextEntry {
  const factory FlavorTextEntry({
    @JsonKey(name: 'flavor_text') String? flavorText,
    @JsonKey(name: 'language') PokemonInfo? languageInfo,
  }) = _FlavorTextEntry;

  factory FlavorTextEntry.fromJson(Json json) => _$FlavorTextEntryFromJson(json);
}
