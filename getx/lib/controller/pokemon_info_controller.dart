import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:getx/apis/model/pokemon_species.dart';
import 'package:getx/apis/pokemon_api.dart';

class PokemonInfoController extends GetxController {
  PokemonInfoController({required this.speciesUrl});

  final String speciesUrl;

  late Rx<PokemonSpecies> pokemonSpecies = const PokemonSpecies().obs;
  late RxBool isLoading = false.obs;

  @override
  void onInit() {
    _initPokemonInfoPage();
    super.onInit();
  }

  void _initPokemonInfoPage() => _loadingAction(
    () async {
      final species = await PokemonApi().getSpecies(speciesUrl: speciesUrl);
      pokemonSpecies.value = species;
    },
  );

  Future<void> _loadingAction(AsyncCallback function) async {
    isLoading.value = true;
    await function()
        .onError((error, _) => Get.defaultDialog(title: error.toString()))
        .whenComplete(() => isLoading.value = false);
  }
}
