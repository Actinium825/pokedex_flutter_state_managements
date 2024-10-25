import 'package:async_redux/async_redux.dart';
import 'package:pokedex_flutter_async_redux/feature/pokemon_info/pokemon_info_connector.dart';
import 'package:pokedex_flutter_async_redux/model/dto/pokemon_dto.dart';
import 'package:pokedex_flutter_async_redux/model/dto/pokemon_species_dto.dart';
import 'package:pokedex_flutter_async_redux/state/action/pokemon_actions.dart';
import 'package:pokedex_flutter_async_redux/state/app_state.dart';

class PokemonInfoVmFactory extends VmFactory<AppState, PokemonInfoConnector, PokemonInfoVm> {
  @override
  PokemonInfoVm fromStore() => PokemonInfoVm(
        selectedPokemon: state.selectedPokemon ?? const PokemonDto(),
        isLoading: state.wait.isWaiting(GetPokemonSpeciesAction.waitKey),
        pokemonSpecies: state.pokemonSpecies ?? const PokemonSpeciesDto(),
      );
}

class PokemonInfoVm extends Vm {
  final PokemonDto selectedPokemon;
  final PokemonSpeciesDto pokemonSpecies;
  final bool isLoading;

  PokemonInfoVm({
    required this.selectedPokemon,
    required this.pokemonSpecies,
    required this.isLoading,
  }) : super(
          equals: [
            selectedPokemon,
            pokemonSpecies,
            isLoading,
          ],
        );
}
