import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/apis/model/pokemon.dart';
import 'package:getx/apis/model/simple_pokemon_list.dart';
import 'package:getx/apis/pokemon_api.dart';
import 'package:getx/classes/shared_prefs_repo.dart';
import 'package:getx/pokemon_list/widgets/theme_choice_dialog.dart';
import 'package:getx/utils/strings.dart';

class AppController extends GetxController {
  late Rx<ThemeMode> themeMode = ThemeMode.system.obs;
  late Rx<SimplePokemonList> simplePokemonList = const SimplePokemonList().obs;
  late RxList<Pokemon> pokemonList = <Pokemon>[].obs;

  @override
  void onInit() {
    _loadTheme();
    super.onInit();
  }

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

  void getInitialPokemonList() async {
    final receivedSimplePokemonList = await PokemonApi().getSimplePokemonList();
    final receivedPokemonList = await PokemonApi().getPokemonList(
      simplePokemonList: receivedSimplePokemonList.simplePokemonList,
    );

    simplePokemonList.value = receivedSimplePokemonList;
    pokemonList.assignAll(receivedPokemonList);
  }
}
