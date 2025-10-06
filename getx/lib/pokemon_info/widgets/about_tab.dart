import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/apis/model/pokemon.dart';
import 'package:getx/classes/pokemon_color_picker.dart';
import 'package:getx/extensions/pokemon_ext.dart';
import 'package:getx/utils/const.dart';

class AboutTab extends StatelessWidget {
  const AboutTab({
    required this.selectedPokemon,
    required this.flavorTextEnglish,
    super.key,
  });

  final Pokemon selectedPokemon;
  final String flavorTextEnglish;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: aboutTabPadding,
      child: ListView(
        children: [
          Padding(
            padding: flavorTextPadding,
            child: Text(
              flavorTextEnglish,
              textAlign: TextAlign.center,
              style: context.textTheme.bodyMedium?.copyWith(
                color: PokemonColorPicker.typeDecorationColor(selectedPokemon.primaryColor, isDarkened: true),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
