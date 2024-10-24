import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_flutter_async_redux/feature/pokemon_info/pokemon_info_page.dart';
import 'package:pokedex_flutter_async_redux/feature/pokemon_info/pokemon_info_vm.dart';
import 'package:pokedex_flutter_async_redux/state/app_state.dart';

class PokemonInfoConnector extends StatelessWidget {
  const PokemonInfoConnector({super.key});

  static const route = 'pokemon-info';

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PokemonInfoVm>(
      vm: PokemonInfoVmFactory.new,
      builder: (_, vm) => PokemonInfoPage(selectedPokemon: vm.selectedPokemon),
    );
  }
}
