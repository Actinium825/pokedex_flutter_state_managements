import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_flutter_async_redux/feature/pokemon_list/pokemon_list_connector.dart';
import 'package:pokedex_flutter_async_redux/model/union_page_state.dart';
import 'package:pokedex_flutter_async_redux/state/action/actions.dart';
import 'package:pokedex_flutter_async_redux/state/action/pokemon_actions.dart';
import 'package:pokedex_flutter_async_redux/state/app_state.dart';
import 'package:pokedex_flutter_async_redux/utils/typedef.dart';

class PokemonListVmFactory extends VmFactory<AppState, PokemonListConnector, PokemonListVm> {
  @override
  PokemonListVm fromStore() => PokemonListVm(
        savedThemeMode: state.savedThemeMode,
        onSetTheme: _onSetTheme,
        unionPageState: _getLoadingState(),
      );

  void _onSetTheme(ThemeMode themeMode) => dispatch(SetThemeAction(themeMode));

  UnionPageState<PokemonList> _getLoadingState() {
    if (state.wait.isWaiting(InitPokemonListPageAction.waitKey)) return const UnionPageState.loading();
    if (state.pokemonList.isEmpty) return const UnionPageState.error('No Pokemon Found');
    return UnionPageState(state.pokemonList);
  }
}

class PokemonListVm extends Vm {
  final ThemeMode savedThemeMode;
  final ValueChanged<ThemeMode> onSetTheme;
  final UnionPageState<PokemonList> unionPageState;

  PokemonListVm({
    required this.savedThemeMode,
    required this.onSetTheme,
    required this.unionPageState,
  }) : super(
          equals: [
            savedThemeMode,
            unionPageState,
          ],
        );
}
