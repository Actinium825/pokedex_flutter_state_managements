import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_flutter_bloc/apis/api_service.dart';
import 'package:pokedex_flutter_bloc/feature/pokemon_info/cubit/pokemon_info_state.dart';
import 'package:pokedex_flutter_bloc/repositories/app_router_repo.dart';

class PokemonInfoCubit extends Cubit<PokemonInfoState> {
  PokemonInfoCubit({required this.speciesUrl}) : super(const PokemonInfoState()) {
    _initPokemonInfoPage();
  }

  final String speciesUrl;

  void _initPokemonInfoPage() => _loadingAction(
    () async {
      final pokemonApi = ApiService.pokemonApi;
      final species = await pokemonApi.getSpecies(speciesUrl: speciesUrl);

      final evolutionChainUrl = species.evolutionChainInfo.url;
      final evolutionChain = await pokemonApi.getEvolutionChain(evolutionChainUrl: evolutionChainUrl);

      final evolutionList = await pokemonApi.getEvolutionList(evolutionChain: evolutionChain);

      emit(
        state.copyWith(
          pokemonSpecies: species,
          pokemonEvolutionChain: evolutionChain,
          pokemonEvolutionList: evolutionList,
        ),
      );
    },
  );

  Future<void> _loadingAction(AsyncCallback function) async {
    emit(state.copyWith(isLoading: true));

    await function()
        .onError(
          (error, _) {
            final context = AppRouterRepo.context;
            if (!context.mounted) return;
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                content: Text(error.toString()),
              ),
            );
          },
        )
        .whenComplete(() => emit(state.copyWith(isLoading: false)));
  }
}
