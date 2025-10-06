import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/apis/model/pokemon.dart';
import 'package:getx/classes/pokemon_color_picker.dart';
import 'package:getx/extensions/pokemon_ext.dart';
import 'package:getx/pokemon_info/widgets/info_scaffold.dart';
import 'package:getx/utils/const.dart';
import 'package:getx/utils/extension.dart';
import 'package:getx/utils/strings.dart';
import 'package:getx/widgets/pokemon_image.dart';
import 'package:getx/widgets/pokemon_type_list.dart';

class PokemonInfoPage extends StatelessWidget {
  const PokemonInfoPage({
    required this.selectedPokemon,
    super.key,
  });

  final Pokemon selectedPokemon;

  @override
  Widget build(BuildContext context) {
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
                child: Column(
                  children: [
                    TabBar(
                      labelColor: typeDecorationColor,
                      indicatorColor: typeDecorationColor,
                      unselectedLabelColor: theme.unselectedWidgetColor,
                      tabs: tabLabels.forLoop((tabLabel) => Tab(text: tabLabel)),
                    ),
                    const Expanded(
                      child: TabBarView(
                        children: [
                          SizedBox(),
                          SizedBox(),
                          SizedBox(),
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
