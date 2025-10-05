import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_flutter_bloc/apis/model/pokemon.dart';
import 'package:pokedex_flutter_bloc/classes/pokemon_color_picker.dart';
import 'package:pokedex_flutter_bloc/cubit/app_cubit.dart';
import 'package:pokedex_flutter_bloc/extensions/pokemon_ext.dart';
import 'package:pokedex_flutter_bloc/feature/pokemon_info/widgets/about_tab.dart';
import 'package:pokedex_flutter_bloc/feature/pokemon_info/widgets/info_scaffold.dart';
import 'package:pokedex_flutter_bloc/utils/const.dart';
import 'package:pokedex_flutter_bloc/utils/extension.dart';
import 'package:pokedex_flutter_bloc/utils/strings.dart';
import 'package:pokedex_flutter_bloc/widgets/loading_indicator.dart';
import 'package:pokedex_flutter_bloc/widgets/pokemon_image.dart';
import 'package:pokedex_flutter_bloc/widgets/pokemon_type_list.dart';

@RoutePage()
class PokemonInfoPage extends StatefulWidget {
  const PokemonInfoPage({
    required this.selectedPokemon,
    super.key,
  });

  final Pokemon selectedPokemon;

  @override
  State<PokemonInfoPage> createState() => _PokemonInfoPageState();
}

class _PokemonInfoPageState extends State<PokemonInfoPage> {
  @override
  void initState() {
    context.read<AppCubit>().getPokemonSpecies(widget.selectedPokemon.speciesInfo.detailsUrl);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = widget.selectedPokemon.primaryColor;
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
                widget.selectedPokemon.capitalizedNamed,
                style: textTheme.displayLarge,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  widget.selectedPokemon.formatId(),
                  style: textTheme.displaySmall,
                ),
              ),
              PokemonTypeList(
                pokemon: widget.selectedPokemon,
                isDecorationShown: true,
              ),
              Expanded(
                flex: context.isPortrait ? 0 : 1,
                child: PokemonImage(
                  pokemon: widget.selectedPokemon,
                  size: infoPageImageSize,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: themeData.primaryColor,
              borderRadius: infoPageModalRadius,
            ),
            child: Padding(
              padding: infoPageModalPadding,
              child: DefaultTabController(
                length: tabLabels.length,
                child: context.select<AppCubit, String>((cubit) => cubit.state.waitKey) == getPokemonSpeciesKey
                    ? LoadingIndicator(color: typeDecorationColor)
                    : Column(
                        children: [
                          TabBar(
                            labelColor: typeDecorationColor,
                            indicatorColor: typeDecorationColor,
                            unselectedLabelColor: themeData.unselectedWidgetColor,
                            tabs: tabLabels.forLoop((tabLabel) => Tab(text: tabLabel)),
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                AboutTab(selectedPokemon: widget.selectedPokemon),
                                const SizedBox(),
                                const SizedBox(),
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
