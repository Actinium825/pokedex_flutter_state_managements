import 'package:flutter/material.dart';
import 'package:pokedex_flutter_async_redux/apis/model/pokemon.dart';
import 'package:pokedex_flutter_async_redux/apis/model/pokemon_evolution_chain.dart';
import 'package:pokedex_flutter_async_redux/apis/model/pokemon_species.dart';
import 'package:pokedex_flutter_async_redux/classes/pokemon_color_picker.dart';
import 'package:pokedex_flutter_async_redux/extensions/pokemon_ext.dart';
import 'package:pokedex_flutter_async_redux/extensions/pokemon_species_ext.dart';
import 'package:pokedex_flutter_async_redux/feature/pokemon_info/widgets/about_tab.dart';
import 'package:pokedex_flutter_async_redux/feature/pokemon_info/widgets/evolution_tab.dart';
import 'package:pokedex_flutter_async_redux/feature/pokemon_info/widgets/info_scaffold.dart';
import 'package:pokedex_flutter_async_redux/feature/pokemon_info/widgets/moves_tab.dart';
import 'package:pokedex_flutter_async_redux/utils/const.dart';
import 'package:pokedex_flutter_async_redux/utils/extension.dart';
import 'package:pokedex_flutter_async_redux/utils/strings.dart';
import 'package:pokedex_flutter_async_redux/utils/typedef.dart';
import 'package:pokedex_flutter_async_redux/widgets/loading_indicator.dart';
import 'package:pokedex_flutter_async_redux/widgets/pokemon_image.dart';
import 'package:pokedex_flutter_async_redux/widgets/pokemon_type_list.dart';

class PokemonInfoPage extends StatelessWidget {
  const PokemonInfoPage({
    required this.selectedPokemon,
    required this.pokemonSpecies,
    required this.isLoading,
    required this.pokemonEvolutionChain,
    required this.pokemonEvolutionList,
    super.key,
  });

  final Pokemon selectedPokemon;
  final PokemonList pokemonEvolutionList;
  final PokemonSpecies pokemonSpecies;
  final PokemonEvolutionChain pokemonEvolutionChain;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final primaryColor = selectedPokemon.primaryColor;
    final typeDecorationColor = PokemonColorPicker.typeDecorationColor(primaryColor, isDarkened: true);
    final textTheme = context.textTheme;
    final themeData = context.themeData;

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
            padding: infoPageModalPadding,
            decoration: BoxDecoration(
              color: themeData.primaryColor,
              borderRadius: infoPageModalRadius,
            ),
            child: Material(
              color: Colors.transparent,
              child: DefaultTabController(
                length: tabLabels.length,
                child: isLoading
                    ? LoadingIndicator(color: typeDecorationColor)
                    : Column(
                        children: [
                          TabBar(
                            labelColor: typeDecorationColor,
                            indicatorColor: typeDecorationColor,
                            unselectedLabelColor: themeData.unselectedWidgetColor,
                            tabs: tabLabels.map((tabLabel) => Tab(text: tabLabel)).toList(),
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                AboutTab(
                                  selectedPokemon: selectedPokemon,
                                  flavorTextEnglish: pokemonSpecies.flavorTextEnglish,
                                ),
                                EvolutionTab(
                                  pokemonEvolutionChain: pokemonEvolutionChain,
                                  pokemonEvolutionList: pokemonEvolutionList,
                                ),
                                MovesTab(selectedPokemon: selectedPokemon),
                              ],
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
