import 'package:async_redux/async_redux.dart';
import 'package:pokedex_flutter_async_redux/feature/pokemon_info/pokemon_info_connector.dart';
import 'package:pokedex_flutter_async_redux/model/dto/pokemon_dto.dart';
import 'package:pokedex_flutter_async_redux/model/dto/pokemon_evolution_chain_dto.dart';
import 'package:pokedex_flutter_async_redux/model/dto/pokemon_species_dto.dart';
import 'package:pokedex_flutter_async_redux/state/action/pokemon_actions.dart';
import 'package:pokedex_flutter_async_redux/state/app_state.dart';
import 'package:pokedex_flutter_async_redux/utils/typedef.dart';

class PokemonInfoVmFactory extends VmFactory<AppState, PokemonInfoConnector, PokemonInfoVm> {
  @override
  PokemonInfoVm fromStore() => PokemonInfoVm(
        selectedPokemon: state.selectedPokemon ?? const PokemonDto(),
        isLoading: state.wait.isWaiting(InitPokemonInfoPageAction.waitKey),
        pokemonSpecies: state.pokemonSpecies ?? const PokemonSpeciesDto(),
        pokemonEvolutionChain: state.pokemonEvolutionChain ?? const PokemonEvolutionChainDto(),
        pokemonEvolutionList: state.pokemonEvolutionList,
      );
}

class PokemonInfoVm extends Vm {
  final PokemonDto selectedPokemon;
  final PokemonList pokemonEvolutionList;
  final PokemonSpeciesDto pokemonSpecies;
  final PokemonEvolutionChainDto pokemonEvolutionChain;
  final bool isLoading;

  PokemonInfoVm({
    required this.selectedPokemon,
    required this.pokemonSpecies,
    required this.isLoading,
    required this.pokemonEvolutionChain,
    required this.pokemonEvolutionList,
  }) : super(
          equals: [
            selectedPokemon,
            pokemonSpecies,
            isLoading,
            pokemonEvolutionChain,
            pokemonEvolutionList,
          ],
        );
}
