import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_flutter_async_redux/pokedex_app.dart';
import 'package:pokedex_flutter_async_redux/pokedex_app_vm.dart';
import 'package:pokedex_flutter_async_redux/state/app_state.dart';

class PokedexAppConnector extends StatelessWidget {
  const PokedexAppConnector({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PokedexAppVm>(
      vm: PokedexAppVmFactory.new,
      builder: (_, vm) => PokedexApp(savedThemeMode: vm.savedThemeMode),
    );
  }
}
