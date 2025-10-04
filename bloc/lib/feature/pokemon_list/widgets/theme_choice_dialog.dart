import 'package:auto_route/auto_route.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_flutter_bloc/utils/extension.dart';
import 'package:pokedex_flutter_bloc/utils/strings.dart';

class ThemeChoiceDialog extends StatelessWidget {
  const ThemeChoiceDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: const Text(chooseThemeMenuLabel),
      content: Material(
        color: Colors.transparent,
        child: RadioGroup<ThemeMode>(
          // TODO: Update value
          groupValue: ThemeMode.light,
          // TODO: Update function
          onChanged: (_) => context.pop(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: ThemeMode.values.forLoop(
              (themeMode) => RadioListTile.adaptive(
                title: Text(themeMode.name.capitalize()),
                value: themeMode,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
