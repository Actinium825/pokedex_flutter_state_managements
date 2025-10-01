import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_flutter_async_redux/model/dto/evolution_chain_info_dto.dart';
import 'package:pokedex_flutter_async_redux/model/dto/flavor_text_entry_dto.dart';

part 'pokemon_species_dto.freezed.dart';

@freezed
abstract class PokemonSpeciesDto with _$PokemonSpeciesDto {
  const factory PokemonSpeciesDto({
    @Default(EvolutionChainInfoDto()) EvolutionChainInfoDto evolutionChainInfo,
    @Default(<FlavorTextEntryDto>[]) List<FlavorTextEntryDto> flavorTextEntries,
  }) = _PokemonSpeciesDto;
}
