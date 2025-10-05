import 'package:flutter/material.dart';
import 'package:getx/pokemon_list/widgets/theme_choice_dialog.dart';
import 'package:getx/utils/extension.dart';
import 'package:getx/utils/strings.dart';

class PokemonListPage extends StatelessWidget {
  const PokemonListPage({super.key});

  void showThemeChoiceDialog(BuildContext context) => showDialog<void>(
    context: context,
    builder: (_) => const ThemeChoiceDialog(),
  );

  void onSelectOption(BuildContext context, String option) {
    if (option == chooseThemeMenuLabel) showThemeChoiceDialog(context);
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
            onSelected: (option) => onSelectOption(context, option),
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: chooseThemeMenuLabel,
                child: Text(chooseThemeMenuLabel),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
