import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/apis/model/pokemon.dart';
import 'package:getx/apis/model/simple_pokemon_list.dart';
import 'package:getx/apis/pokemon_api.dart';
import 'package:getx/classes/shared_prefs_repo.dart';
import 'package:getx/model/union_page_state.dart';
import 'package:getx/pokemon_list/widgets/theme_choice_dialog.dart';
import 'package:getx/utils/strings.dart';
import 'package:getx/utils/typedef.dart';

class AppController extends GetxController {
  late Rx<ThemeMode> themeMode = ThemeMode.system.obs;
  late Rx<SimplePokemonList> simplePokemonList = const SimplePokemonList().obs;
  late RxList<Pokemon> pokemonList = <Pokemon>[].obs;
  late RxString waitKey = ''.obs;

  late final ScrollController scrollController;

  @override
  void onInit() {
    _loadTheme();
    super.onInit();
  }

  void initPokemonListPage() {
    scrollController = ScrollController()..addListener(_onReachEnd);
    getInitialPokemonList();
  }

  void disposePokemonListPage() {
    scrollController.dispose();
  }

  void _onReachEnd() {
    final position = scrollController.position;
    if (position.pixels == position.maxScrollExtent) _getMorePokemon();
  }

  void _getMorePokemon() => _loadingAction(
    getMorePokemonKey,
    () async {
      final receivedSimplePokemonList = await PokemonApi().getSimplePokemonList(
        nextPageUrl: simplePokemonList.value.next,
      );
      final receivedPokemonList = await PokemonApi().getPokemonList(
        simplePokemonList: receivedSimplePokemonList.simplePokemonList,
      );

      simplePokemonList.value = receivedSimplePokemonList;
      pokemonList.addAll(receivedPokemonList);
    },
  );

  void _loadTheme() {
    final themeModeIndex = SharedPrefsRepo.prefs.getInt(themeSharedPrefsKey) ?? ThemeMode.system.index;
    themeMode.value = ThemeMode.values.elementAt(themeModeIndex);
  }

  void onSelectTheme(ThemeMode? selectedThemeMode) async {
    themeMode.value = selectedThemeMode ?? ThemeMode.system;

    SharedPrefsRepo.prefs.setInt(themeSharedPrefsKey, themeMode.value.index);

    final context = Get.context;
    if (context != null) Navigator.pop(context);
  }

  void onSelectOption(String option) {
    if (option == chooseThemeMenuLabel) Get.dialog(const ThemeChoiceDialog());
  }

  void getInitialPokemonList() => _loadingAction(
    initPokemonListKey,
    () async {
      final receivedSimplePokemonList = await PokemonApi().getSimplePokemonList();
      final receivedPokemonList = await PokemonApi().getPokemonList(
        simplePokemonList: receivedSimplePokemonList.simplePokemonList,
      );

      simplePokemonList.value = receivedSimplePokemonList;
      pokemonList.assignAll(receivedPokemonList);
    },
  );

  UnionPageState<PokemonList> pokemonListState() {
    if (waitKey.value == initPokemonListKey) return const UnionPageState.loading();
    return pokemonList.isEmpty ? const UnionPageState.error(emptyPokemonLabel) : UnionPageState(pokemonList);
  }

  Future<void> _loadingAction(String waitKey, AsyncCallback function) async {
    if (this.waitKey.value == waitKey) return;

    this.waitKey.value = waitKey;

    await function()
        .onError((error, _) => Get.defaultDialog(title: error.toString()))
        .whenComplete(() => this.waitKey.value = '');
  }
}
