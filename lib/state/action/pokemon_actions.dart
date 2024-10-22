import 'package:async_redux/async_redux.dart';
import 'package:pokedex_flutter_async_redux/apis/api_service.dart';
import 'package:pokedex_flutter_async_redux/model/dto/simple_pokemon_dto.dart';
import 'package:pokedex_flutter_async_redux/state/action/actions.dart';
import 'package:pokedex_flutter_async_redux/state/app_state.dart';

/// Gets the pokemon list at the start to display
/// Gets the simple pokemon list first before getting each individual details
class InitPokemonListPageAction extends LoadingAction {
  InitPokemonListPageAction() : super(actionKey: waitKey);

  static const waitKey = 'init-pokemon-list-page';

  @override
  Future<AppState> reduce() async {
    await dispatchAndWait(GetSimplePokemonListAction());
    await dispatchAndWait(GetPokemonListAction(simplePokemonList: state.simplePokemonList.simplePokemonList));
    return state;
  }
}

/// Gets the simple pokemon list to be used for getting all individual pokemon details
/// Update the state's next property and add to existing simple pokemon list
class GetSimplePokemonListAction extends ReduxAction<AppState> {
  @override
  Future<AppState> reduce() async {
    final receivedSimplePokemonList = await ApiService.pokemonApi.getSimplePokemonList();

    final simplePokemonList = state.simplePokemonList;
    final updatedSimplePokemonList = simplePokemonList.copyWith(
      next: receivedSimplePokemonList.next,
      simplePokemonList: [...simplePokemonList.simplePokemonList, ...receivedSimplePokemonList.simplePokemonList],
    );

    return state.copyWith(simplePokemonList: updatedSimplePokemonList);
  }
}

/// Get all details of the provided [simplePokemonList]
/// Adds to the existing state's pokemon list
class GetPokemonListAction extends ReduxAction<AppState> {
  GetPokemonListAction({required this.simplePokemonList});

  final List<SimplePokemonDto> simplePokemonList;

  @override
  Future<AppState> reduce() async {
    final receivedPokemonList = await ApiService.pokemonApi.getPokemonList(simplePokemonList);
    final updatedPokemonList = [...state.pokemonList, ...receivedPokemonList];

    return state.copyWith(pokemonList: updatedPokemonList);
  }
}
