import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_flutter_async_redux/feature/pokemon_list/pokemon_list_connector.dart';
import 'package:pokedex_flutter_async_redux/state/action/actions.dart';
import 'package:pokedex_flutter_async_redux/state/app_state.dart';

class PokemonListVmFactory extends VmFactory<AppState, PokemonListConnector, PokemonListVm> {
  @override
  PokemonListVm fromStore() => PokemonListVm(
        savedThemeMode: state.savedThemeMode,
        onSetTheme: _onSetTheme,
      );

  void _onSetTheme(ThemeMode themeMode) => dispatch(SetThemeAction(themeMode));
}

class PokemonListVm extends Vm {
  final ThemeMode savedThemeMode;
  final ValueChanged<ThemeMode> onSetTheme;

  PokemonListVm({
    required this.savedThemeMode,
    required this.onSetTheme,
  }) : super(equals: [savedThemeMode]);
}
