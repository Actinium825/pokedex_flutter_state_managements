import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:getx/apis/model/pokemon.dart';
import 'package:getx/apis/model/pokemon_evolution_chain.dart';
import 'package:getx/apis/model/pokemon_species.dart';
import 'package:getx/apis/pokemon_api.dart';

class PokemonInfoController extends GetxController {
  PokemonInfoController({required this.speciesUrl});

  final String speciesUrl;

  late Rx<PokemonSpecies> pokemonSpecies = const PokemonSpecies().obs;
  late Rx<PokemonEvolutionChain> pokemonEvolutionChain = const PokemonEvolutionChain().obs;
  late RxList<Pokemon> pokemonEvolutionList = <Pokemon>[].obs;
  late RxBool isLoading = false.obs;

  @override
  void onInit() {
    _initPokemonInfoPage();
    super.onInit();
  }

  void _initPokemonInfoPage() => _loadingAction(
    () async {
      final species = await PokemonApi().getSpecies(speciesUrl: speciesUrl);

      final evolutionChainUrl = species.evolutionChainInfo.url;
      final evolutionChain = await PokemonApi().getEvolutionChain(evolutionChainUrl: evolutionChainUrl);

      final evolutionList = await PokemonApi().getEvolutionList(evolutionChain: evolutionChain);

      pokemonSpecies.value = species;
      pokemonEvolutionChain.value = evolutionChain;
      pokemonEvolutionList.assignAll(evolutionList);
    },
  );

  Future<void> _loadingAction(AsyncCallback function) async {
    isLoading.value = true;
    await function()
        .onError((error, _) => Get.defaultDialog(title: error.toString()))
        .whenComplete(() => isLoading.value = false);
  }
}
