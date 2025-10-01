import 'package:pokedex_flutter_async_redux/apis/model/flavor_text_entry.dart';
import 'package:pokedex_flutter_async_redux/extensions/pokemon_info_ext.dart';
import 'package:pokedex_flutter_async_redux/model/dto/flavor_text_entry_dto.dart';
import 'package:pokedex_flutter_async_redux/model/dto/pokemon_info_dto.dart';

extension FlavorTextEntryExt on FlavorTextEntry {
  FlavorTextEntryDto toDto() => FlavorTextEntryDto(
        flavorText: flavorText ?? '',
        languageInfo: languageInfo?.toDto() ?? const PokemonInfoDto(),
      );
}
