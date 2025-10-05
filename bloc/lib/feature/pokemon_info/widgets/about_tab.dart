import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_flutter_bloc/apis/model/pokemon.dart';
import 'package:pokedex_flutter_bloc/classes/pokemon_color_picker.dart';
import 'package:pokedex_flutter_bloc/cubit/app_cubit.dart';
import 'package:pokedex_flutter_bloc/extensions/pokemon_ext.dart';
import 'package:pokedex_flutter_bloc/extensions/pokemon_species_ext.dart';
import 'package:pokedex_flutter_bloc/feature/pokemon_info/widgets/table_label.dart';
import 'package:pokedex_flutter_bloc/utils/const.dart';
import 'package:pokedex_flutter_bloc/utils/extension.dart';
import 'package:pokedex_flutter_bloc/utils/strings.dart';
import 'package:sprintf/sprintf.dart';

class AboutTab extends StatelessWidget {
  const AboutTab({
    required this.selectedPokemon,
    super.key,
  });

  final Pokemon selectedPokemon;

  List<MapEntry<Color, String>> get _table {
    final primaryColor = selectedPokemon.primaryColor;
    final lightenColor = PokemonColorPicker.typeDecorationColor(primaryColor);

    return [
      MapEntry(primaryColor, sprintf(heightValue, [selectedPokemon.heightInDecimeters / 10])),
      MapEntry(lightenColor, sprintf(weightValue, [selectedPokemon.weightInDecimeters / 10])),
      MapEntry(
        primaryColor,
        selectedPokemon.abilityList.forLoop((ability) => ability.abilityInfo.name.capitalize()).join(', '),
      ),
      MapEntry(lightenColor, sprintf(xpValue, [selectedPokemon.baseExperience])),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = selectedPokemon.primaryColor;
    final borderSide = BorderSide(color: primaryColor);

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
                color: PokemonColorPicker.typeDecorationColor(primaryColor, isDarkened: true),
              ),
            ),
          ),
          Table(
            border: TableBorder(
              verticalInside: borderSide,
              horizontalInside: borderSide,
              top: borderSide,
              left: borderSide,
              right: borderSide,
              bottom: borderSide,
            ),
            columnWidths: const {
              0: IntrinsicColumnWidth(),
              1: FlexColumnWidth(),
            },
            children: _table.forLoopIndexed(
              (index, entry) => TableRow(
                decoration: BoxDecoration(color: entry.key),
                children: [
                  TableLabel(
                    label: aboutTableHeaders[index],
                    textAlign: TextAlign.right,
                  ),
                  TableLabel(label: entry.value),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
