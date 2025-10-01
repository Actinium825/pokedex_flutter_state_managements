import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_flutter_riverpod/apis/model/pokemon.dart';
import 'package:pokedex_flutter_riverpod/classes/pokemon_color_picker.dart';
import 'package:pokedex_flutter_riverpod/extensions/pokemon_ability_ext.dart';
import 'package:pokedex_flutter_riverpod/extensions/pokemon_ext.dart';
import 'package:pokedex_flutter_riverpod/extensions/pokemon_species_ext.dart';
import 'package:pokedex_flutter_riverpod/feature/pokemon_info/widgets/table_label.dart';
import 'package:pokedex_flutter_riverpod/providers/pokemon_species_provider.dart';
import 'package:pokedex_flutter_riverpod/utils/const.dart';
import 'package:pokedex_flutter_riverpod/utils/extension.dart';
import 'package:pokedex_flutter_riverpod/utils/strings.dart';
import 'package:sprintf/sprintf.dart';

class AboutTab extends ConsumerWidget {
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
      MapEntry(primaryColor, selectedPokemon.abilityList.map((ability) => ability.name.capitalize()).join(', ')),
      MapEntry(lightenColor, sprintf(xpValue, [selectedPokemon.baseExperience])),
    ];
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final primaryColor = selectedPokemon.primaryColor;
    final borderSide = BorderSide(color: primaryColor);

    return Padding(
      padding: aboutTabPadding,
      child: ListView(
        children: [
          Padding(
            padding: flavorTextPadding,
            child: Text(
              ref.read(pokemonSpeciesRefProvider).flavorTextEnglish,
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
            children: _table.mapIndexed(
              (index, entry) {
                return TableRow(
                  decoration: BoxDecoration(color: entry.key),
                  children: [
                    TableLabel(
                      label: aboutTableHeaders[index],
                      textAlign: TextAlign.right,
                    ),
                    TableLabel(label: entry.value),
                  ],
                );
              },
            ).toList(),
          ),
        ],
      ),
    );
  }
}
