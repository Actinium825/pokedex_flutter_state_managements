import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_getx/apis/model/pokemon.dart';
import 'package:pokedex_getx/classes/pokemon_color_picker.dart';
import 'package:pokedex_getx/controller/pokemon_info_controller.dart';
import 'package:pokedex_getx/extensions/pokemon_ext.dart';
import 'package:pokedex_getx/extensions/pokemon_species_ext.dart';
import 'package:pokedex_getx/feature/pokemon_info/widgets/about_tab.dart';
import 'package:pokedex_getx/feature/pokemon_info/widgets/evolution_tab.dart';
import 'package:pokedex_getx/feature/pokemon_info/widgets/info_scaffold.dart';
import 'package:pokedex_getx/feature/pokemon_info/widgets/moves_tab.dart';
import 'package:pokedex_getx/utils/const.dart';
import 'package:pokedex_getx/utils/extension.dart';
import 'package:pokedex_getx/utils/strings.dart';
import 'package:pokedex_getx/widgets/loading_indicator.dart';
import 'package:pokedex_getx/widgets/pokemon_image.dart';
import 'package:pokedex_getx/widgets/pokemon_type_list.dart';

class PokemonInfoPage extends StatelessWidget {
  const PokemonInfoPage({
    required this.selectedPokemon,
    super.key,
  });

  final Pokemon selectedPokemon;

  @override
  Widget build(BuildContext context) {
    final pokemonInfoController = Get.put<PokemonInfoController>(
      PokemonInfoController(speciesUrl: selectedPokemon.speciesInfo.detailsUrl),
    );
    final primaryColor = selectedPokemon.primaryColor;
    final typeDecorationColor = PokemonColorPicker.typeDecorationColor(primaryColor, isDarkened: true);
    final textTheme = context.textTheme;
    final theme = context.theme;

    return InfoScaffold(
      color: primaryColor,
      children: [
        Padding(
          padding: infoPageHeaderPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                selectedPokemon.capitalizedNamed,
                style: textTheme.displayLarge,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  selectedPokemon.formatId(),
                  style: textTheme.displaySmall,
                ),
              ),
              PokemonTypeList(
                pokemon: selectedPokemon,
                isDecorationShown: true,
              ),
              Expanded(
                flex: context.isPortrait ? 0 : 1,
                child: PokemonImage(
                  pokemon: selectedPokemon,
                  size: infoPageImageSize,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: theme.primaryColor,
              borderRadius: infoPageModalRadius,
            ),
            padding: infoPageModalPadding,
            child: Material(
              color: Colors.transparent,
              child: DefaultTabController(
                length: tabLabels.length,
                child: Obx(
                  () => switch (pokemonInfoController.isLoading.value) {
                    true => LoadingIndicator(color: typeDecorationColor),
                    false => Column(
                      children: [
                        TabBar(
                          labelColor: typeDecorationColor,
                          indicatorColor: typeDecorationColor,
                          unselectedLabelColor: theme.unselectedWidgetColor,
                          tabs: tabLabels.forLoop((tabLabel) => Tab(text: tabLabel)),
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              AboutTab(
                                selectedPokemon: selectedPokemon,
                                flavorTextEnglish: pokemonInfoController.pokemonSpecies.value.flavorTextEnglish,
                              ),
                              EvolutionTab(
                                pokemonEvolutionChain: pokemonInfoController.pokemonEvolutionChain.value,
                                pokemonEvolutionList: pokemonInfoController.pokemonEvolutionList,
                              ),
                              MovesTab(selectedPokemon: selectedPokemon),
                            ],
                          ),
                        ),
                      ],
                    ),
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
