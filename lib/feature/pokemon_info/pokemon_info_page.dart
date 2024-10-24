import 'package:flutter/material.dart';
import 'package:pokedex_flutter_async_redux/extensions/pokemon_ext.dart';
import 'package:pokedex_flutter_async_redux/model/dto/pokemon_dto.dart';
import 'package:pokedex_flutter_async_redux/utils/const.dart';
import 'package:pokedex_flutter_async_redux/utils/extension.dart';
import 'package:pokedex_flutter_async_redux/utils/pokemon_color_picker.dart';
import 'package:pokedex_flutter_async_redux/utils/strings.dart';
import 'package:pokedex_flutter_async_redux/widgets/pokemon_image.dart';
import 'package:pokedex_flutter_async_redux/widgets/pokemon_type_list.dart';

class PokemonInfoPage extends StatelessWidget {
  const PokemonInfoPage({
    required this.selectedPokemon,
    super.key,
  });

  final PokemonDto selectedPokemon;

  @override
  Widget build(BuildContext context) {
    final primaryColor = selectedPokemon.primaryColor;
    final typeDecorationColor = PokemonColorPicker.typeDecorationColor(primaryColor, isDarkened: true);
    final textTheme = context.textTheme;
    final themeData = context.themeData;

    return Scaffold(
      appBar: AppBar(backgroundColor: primaryColor),
      backgroundColor: primaryColor,
      body: Column(
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
                    '#${selectedPokemon.id.toString().padLeft(idNumberPadWidth, '0')}',
                    style: textTheme.displaySmall,
                  ),
                ),
                PokemonTypeList(
                  pokemon: selectedPokemon,
                  isDecorationShown: true,
                ),
                PokemonImage(
                  pokemon: selectedPokemon,
                  size: infoPageImageSize,
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
              child: DefaultTabController(
                length: tabLabels.length,
                child: Column(
                  children: [
                    TabBar(
                      labelColor: typeDecorationColor,
                      indicatorColor: typeDecorationColor,
                      unselectedLabelColor: themeData.unselectedWidgetColor,
                      tabs: tabLabels.map((tabLabel) => Tab(text: tabLabel)).toList(),
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
        ],
      ),
    );
  }
}
