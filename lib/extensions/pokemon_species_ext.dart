import 'package:pokedex_flutter_async_redux/apis/model/pokemon_species.dart';
import 'package:pokedex_flutter_async_redux/extensions/evolution_chain_info_ext.dart';
import 'package:pokedex_flutter_async_redux/extensions/flavor_text_entry_ext.dart';
import 'package:pokedex_flutter_async_redux/model/dto/evolution_chain_info_dto.dart';
import 'package:pokedex_flutter_async_redux/model/dto/pokemon_species_dto.dart';

extension PokemonSpeciesExt on PokemonSpecies {
  PokemonSpeciesDto toDto() => PokemonSpeciesDto(
        evolutionChainInfo: evolutionChainInfo?.toDto() ?? const EvolutionChainInfoDto(),
        flavorTextEntries: [...?flavorTextEntries?.map((flavorTextEntry) => flavorTextEntry.toDto())],
      );
}

