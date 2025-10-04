import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_flutter_bloc/apis/api_service.dart';
import 'package:pokedex_flutter_bloc/cubit/app_state.dart';
import 'package:pokedex_flutter_bloc/feature/pokemon_list/widgets/theme_choice_dialog.dart';
import 'package:pokedex_flutter_bloc/model/union_page_state.dart';
import 'package:pokedex_flutter_bloc/repositories/app_router_repo.dart';
import 'package:pokedex_flutter_bloc/repositories/shared_prefs_repo.dart';
import 'package:pokedex_flutter_bloc/utils/strings.dart';
import 'package:pokedex_flutter_bloc/utils/typedef.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState()) {
    loadTheme();
  }

  void loadTheme() {
    final themeModeIndex = SharedPrefsRepo.prefs.getInt(themeSharedPrefsKey) ?? ThemeMode.system.index;
    emit(state.copyWith(themeMode: ThemeMode.values.elementAt(themeModeIndex)));
  }

  void showThemeChoiceDialog() => showDialog<void>(
    context: AppRouterRepo.context,
    builder: (_) => const ThemeChoiceDialog(),
  );

  void onSelectOption(String option) {
    if (option == chooseThemeMenuLabel) showThemeChoiceDialog();
  }

  void onSelectTheme(ThemeMode? themeMode) async {
    emit(state.copyWith(themeMode: themeMode ?? ThemeMode.system));
    SharedPrefsRepo.prefs.setInt(themeSharedPrefsKey, state.themeMode.index);
    AppRouterRepo.context.pop();
  }

  Future<void> getSimplePokemonList({String? nextPageUrl}) async {
    await _loadingAction(
      () async {
        final simplePokemonList = await ApiService.pokemonApi.getSimplePokemonList(nextPageUrl: nextPageUrl);
        emit(state.copyWith(simplePokemonList: simplePokemonList));
      },
    );
  }

  Future<void> getPokemonList() async {
    await _loadingAction(
      () async {
        final receivedPokemonList = await ApiService.pokemonApi.getPokemonList(
          simplePokemonList: state.simplePokemonList.simplePokemonList,
        );
        final updatedPokemonList = state.pokemonList.followedBy(receivedPokemonList).toList();

        emit(state.copyWith(pokemonList: updatedPokemonList));
      },
    );
  }

  Future<void> initPokemonListPage() async {
    await getSimplePokemonList();
    await getPokemonList();
  }

  UnionPageState<PokemonList> pokemonListState() {
    if (state.isLoading) return const UnionPageState.loading();
    if (state.pokemonList.isEmpty) return const UnionPageState.error(emptyPokemonLabel);
    return UnionPageState(state.pokemonList);
  }

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
