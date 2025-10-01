import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_flutter_async_redux/apis/model/pokemon.dart';
import 'package:pokedex_flutter_async_redux/feature/pokemon_list/pokemon_list_connector.dart';
import 'package:pokedex_flutter_async_redux/model/union_page_state.dart';
import 'package:pokedex_flutter_async_redux/state/action/actions.dart';
import 'package:pokedex_flutter_async_redux/state/action/pokemon_actions.dart';
import 'package:pokedex_flutter_async_redux/state/app_state.dart';
import 'package:pokedex_flutter_async_redux/utils/strings.dart';
import 'package:pokedex_flutter_async_redux/utils/typedef.dart';

class PokemonListVmFactory extends VmFactory<AppState, PokemonListConnector, PokemonListVm> {
  @override
  PokemonListVm fromStore() => PokemonListVm(
        savedThemeMode: state.savedThemeMode,
        onSetTheme: _onSetTheme,
        unionPageState: _getLoadingState(),
        unionSearchPageState: _getSearchingState(),
        onGetMorePokemon: _onGetMorePokemon,
        isGettingMorePokemon: state.wait.isWaiting(GetMorePokemonAction.waitKey),
        onRefreshPage: _onRefreshPage,
        onSearchPokemon: _onSearchPokemon,
        onSelectPokemon: _onSelectPokemon,
      );

  void _onSetTheme(ThemeMode themeMode) => dispatch(SetThemeAction(themeMode));

  UnionPageState<PokemonList> _getLoadingState() {
    if (state.wait.isWaiting(InitPokemonListPageAction.waitKey)) return const UnionPageState.loading();
    final pokemonList = state.pokemonList;
    return pokemonList.isEmpty ? const UnionPageState.error(emptyPokemonLabel) : UnionPageState(pokemonList);
  }

  UnionPageState<PokemonList> _getSearchingState() {
    if (state.wait.isWaiting(SearchPokemonAction.waitKey)) return const UnionPageState.loading();
    final searchResultList = state.searchResultList;
    return searchResultList.isEmpty ? const UnionPageState.error(emptyPokemonLabel) : UnionPageState(searchResultList);
  }

  void _onGetMorePokemon() => dispatch(GetMorePokemonAction());

  Future<void> _onRefreshPage() async => dispatch(InitPokemonListPageAction());

  void _onSearchPokemon(String searchText) => dispatch(SearchPokemonAction(searchText: searchText));

  void _onSelectPokemon(Pokemon selectedPokemon) => dispatch(SelectPokemonAction(selectedPokemon: selectedPokemon));
}

class PokemonListVm extends Vm {
  final ThemeMode savedThemeMode;
  final ValueChanged<ThemeMode> onSetTheme;
  final ValueChanged<String> onSearchPokemon;
  final ValueChanged<Pokemon> onSelectPokemon;
  final UnionPageState<PokemonList> unionPageState;
  final UnionPageState<PokemonList> unionSearchPageState;
  final VoidCallback onGetMorePokemon;
  final bool isGettingMorePokemon;
  final AsyncCallback onRefreshPage;

  PokemonListVm({
    required this.savedThemeMode,
    required this.onSetTheme,
    required this.unionPageState,
    required this.unionSearchPageState,
    required this.onGetMorePokemon,
    required this.isGettingMorePokemon,
    required this.onRefreshPage,
    required this.onSearchPokemon,
    required this.onSelectPokemon,
  }) : super(
          equals: [
            savedThemeMode,
            unionPageState,
            isGettingMorePokemon,
            unionSearchPageState,
          ],
        );
}
