import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex_flutter_async_redux/feature/pokemon_list/widgets/pokemon_card.dart';
import 'package:pokedex_flutter_async_redux/utils/const.dart';
import 'package:pokedex_flutter_async_redux/utils/extension.dart';
import 'package:pokedex_flutter_async_redux/utils/strings.dart';
import 'package:pokedex_flutter_async_redux/utils/typedef.dart';

class PokemonListPage extends StatelessWidget {
  const PokemonListPage({
    required this.savedThemeMode,
    required this.onSetTheme,
    required this.pokemonList,
    super.key,
  });

  final ThemeMode savedThemeMode;
  final ValueChanged<ThemeMode> onSetTheme;
  final PokemonList pokemonList;

  void _showThemeChoiceDialog(BuildContext context) => showDialog<void>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text(chooseThemeMenuLabel),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: ThemeMode.values.map(
              (themeMode) {
                return RadioListTile(
                  title: Text(themeMode.name.capitalize()),
                  value: themeMode,
                  groupValue: savedThemeMode,
                  onChanged: (value) => _onSelectTheme(context, value),
                );
              },
            ).toList(),
          ),
        ),
      );

  void _onSelectOption(BuildContext context, String option) {
    if (option == chooseThemeMenuLabel) _showThemeChoiceDialog(context);
  }

  void _onSelectTheme(BuildContext context, ThemeMode? themeMode) {
    onSetTheme(themeMode ?? ThemeMode.system);
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appTitle,
          style: context.textTheme.displayMedium,
        ),
        actions: [
          PopupMenuButton(
            onSelected: (option) => _onSelectOption(context, option),
            itemBuilder: (_) => [chooseThemeMenuLabel].map(
              (choice) {
                return PopupMenuItem(
                  value: choice,
                  child: Text(choice),
                );
              },
            ).toList(),
          ),
        ],
      ),
      body: Padding(
        padding: pokemonListPagePadding,
        child: CustomScrollView(
          slivers: [
            SliverGrid(
              gridDelegate: pokemonGridDelegate,
              delegate: SliverChildBuilderDelegate(
                (_, index) => PokemonCard(
                  pokemon: pokemonList[index],
                  // TODO: Add function
                  onTap: () {},
                ),
                childCount: pokemonList.length,
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: pokemonListPageFooterHeight))
          ],
        ),
      ),
    );
  }
}
