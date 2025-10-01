import 'package:async_redux/async_redux.dart';
import 'package:pokedex_flutter_async_redux/apis/model/pokemon.dart';
import 'package:pokedex_flutter_async_redux/apis/model/pokemon_evolution_chain.dart';
import 'package:pokedex_flutter_async_redux/apis/model/pokemon_species.dart';
import 'package:pokedex_flutter_async_redux/feature/pokemon_info/pokemon_info_connector.dart';
import 'package:pokedex_flutter_async_redux/state/action/pokemon_actions.dart';
import 'package:pokedex_flutter_async_redux/state/app_state.dart';
import 'package:pokedex_flutter_async_redux/utils/typedef.dart';

class PokemonInfoVmFactory extends VmFactory<AppState, PokemonInfoConnector, PokemonInfoVm> {
  @override
  PokemonInfoVm fromStore() => PokemonInfoVm(
        selectedPokemon: state.selectedPokemon ?? const Pokemon(),
        isLoading: state.wait.isWaiting(InitPokemonInfoPageAction.waitKey),
        pokemonSpecies: state.pokemonSpecies ?? const PokemonSpecies(),
        pokemonEvolutionChain: state.pokemonEvolutionChain ?? const PokemonEvolutionChain(),
        pokemonEvolutionList: state.pokemonEvolutionList,
      );
}

class PokemonInfoVm extends Vm {
  final Pokemon selectedPokemon;
  final PokemonList pokemonEvolutionList;
  final PokemonSpecies pokemonSpecies;
  final PokemonEvolutionChain pokemonEvolutionChain;
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
