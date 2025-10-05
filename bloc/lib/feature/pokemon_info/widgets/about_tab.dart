import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_flutter_bloc/apis/model/pokemon.dart';
import 'package:pokedex_flutter_bloc/classes/pokemon_color_picker.dart';
import 'package:pokedex_flutter_bloc/cubit/app_cubit.dart';
import 'package:pokedex_flutter_bloc/extensions/pokemon_ext.dart';
import 'package:pokedex_flutter_bloc/extensions/pokemon_species_ext.dart';
import 'package:pokedex_flutter_bloc/utils/const.dart';
import 'package:pokedex_flutter_bloc/utils/extension.dart';

class AboutTab extends StatelessWidget {
  const AboutTab({
    required this.selectedPokemon,
    super.key,
  });

  final Pokemon selectedPokemon;

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
              context.read<AppCubit>().state.pokemonSpecies.flavorTextEnglish,
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
