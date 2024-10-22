import 'package:async_redux/async_redux.dart';
import 'package:pokedex_flutter_async_redux/apis/api_service.dart';
import 'package:pokedex_flutter_async_redux/state/app_state.dart';

/// Gets the simple pokemon list to be used for getting all individual pokemon details
/// Update the state's next property and add to existing simple pokemon list
class GetSimplePokemonListAction extends ReduxAction<AppState> {
  @override
  Future<AppState> reduce() async {
    final receivedSimplePokemonList = await ApiService.pokemonApi.getSimplePokemonList();

    final simplePokemonList = state.simplePokemonList;
    final updatedSimplePokemonList = simplePokemonList.copyWith(
      next: simplePokemonList.next,
      simplePokemonList: [...simplePokemonList.simplePokemonList, ...receivedSimplePokemonList.simplePokemonList],
    );

    return state.copyWith(simplePokemonList: updatedSimplePokemonList);
  }
}
