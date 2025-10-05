import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:getx/utils/extension.dart';
import 'package:getx/utils/strings.dart';

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
          onChanged: (_) => Navigator.pop(context),
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
