import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_flutter_async_redux/pokedex_app_connector.dart';
import 'package:pokedex_flutter_async_redux/state/app_state.dart';

class PokedexAppVmFactory extends VmFactory<AppState, PokedexAppConnector, PokedexAppVm> {
  @override
  PokedexAppVm fromStore() => PokedexAppVm(savedThemeMode: state.savedThemeMode);
}

class PokedexAppVm extends Vm {
  final ThemeMode savedThemeMode;

  PokedexAppVm({required this.savedThemeMode}) : super(equals: [savedThemeMode]);
}
