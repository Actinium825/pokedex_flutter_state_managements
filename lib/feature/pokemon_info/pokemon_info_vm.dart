import 'package:async_redux/async_redux.dart';
import 'package:pokedex_flutter_async_redux/feature/pokemon_info/pokemon_info_connector.dart';
import 'package:pokedex_flutter_async_redux/model/dto/pokemon_dto.dart';
import 'package:pokedex_flutter_async_redux/state/app_state.dart';

class PokemonInfoVmFactory extends VmFactory<AppState, PokemonInfoConnector, PokemonInfoVm> {
  @override
  PokemonInfoVm fromStore() => PokemonInfoVm(selectedPokemon: state.selectedPokemon ?? const PokemonDto());
}

class PokemonInfoVm extends Vm {
  final PokemonDto selectedPokemon;

  PokemonInfoVm({required this.selectedPokemon}) : super(equals: [selectedPokemon]);
}
