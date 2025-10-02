import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_flutter_async_redux/feature/pokemon_list/pokemon_list_page.dart';
import 'package:pokedex_flutter_async_redux/feature/pokemon_list/pokemon_list_vm.dart';
import 'package:pokedex_flutter_async_redux/state/action/pokemon_actions.dart';
import 'package:pokedex_flutter_async_redux/state/app_state.dart';

class PokemonListConnector extends StatelessWidget {
  const PokemonListConnector({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PokemonListVm>(
      vm: PokemonListVmFactory.new,
      onInit: (store) => store.dispatch(InitPokemonListPageAction()),
      builder: (_, vm) => PokemonListPage(
        savedThemeMode: vm.savedThemeMode,
        onSetTheme: vm.onSetTheme,
        unionPageState: vm.unionPageState,
        unionSearchPageState: vm.unionSearchPageState,
        onGetMorePokemon: vm.onGetMorePokemon,
        isGettingMorePokemon: vm.isGettingMorePokemon,
        onRefreshPage: vm.onRefreshPage,
        onSearchPokemon: vm.onSearchPokemon,
        onSelectPokemon: vm.onSelectPokemon,
      ),
    );
  }
}
