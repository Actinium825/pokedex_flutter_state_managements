import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex_flutter_async_redux/utils/extension.dart';
import 'package:pokedex_flutter_async_redux/utils/strings.dart';

class PokemonListPage extends StatelessWidget {
  const PokemonListPage({super.key});

  static const route = '/';

  void _showThemeChoiceDialog(BuildContext context) => showDialog<void>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text(chooseThemeMenuLabel),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: themeOptionLabels.map(
              (themeOption) {
                return RadioListTile(
                  title: Text(themeOption),
                  value: ThemeMode.light,
                  // TODO: Update value
                  groupValue: ThemeMode.light,
                  // TODO: Update function
                  onChanged: (_) => context.pop(),
                );
              },
            ).toList(),
          ),
        ),
      );

  void _onSelectOption(BuildContext context, String option) {
    if (option == chooseThemeMenuLabel) _showThemeChoiceDialog(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appTitle,
          style: context.themeData.textTheme.displayMedium,
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
    );
  }
}
