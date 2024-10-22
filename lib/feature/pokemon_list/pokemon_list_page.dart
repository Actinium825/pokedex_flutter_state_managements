import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex_flutter_async_redux/utils/extension.dart';
import 'package:pokedex_flutter_async_redux/utils/strings.dart';

class PokemonListPage extends StatelessWidget {
  const PokemonListPage({
    required this.savedThemeMode,
    required this.onSetTheme,
    super.key,
  });

  final ThemeMode savedThemeMode;
  final ValueChanged<ThemeMode> onSetTheme;

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
