import 'package:flutter/material.dart';
import 'package:pokedex_flutter_async_redux/extensions/pokemon_ext.dart';
import 'package:pokedex_flutter_async_redux/model/dto/pokemon_dto.dart';
import 'package:pokedex_flutter_async_redux/utils/const.dart';
import 'package:pokedex_flutter_async_redux/utils/extension.dart';
import 'package:pokedex_flutter_async_redux/utils/pokemon_color_picker.dart';

class AboutTab extends StatelessWidget {
  const AboutTab({
    required this.selectedPokemon,
    required this.flavorTextEnglish,
    super.key,
  });

  final PokemonDto selectedPokemon;
  final String flavorTextEnglish;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: aboutTabPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
