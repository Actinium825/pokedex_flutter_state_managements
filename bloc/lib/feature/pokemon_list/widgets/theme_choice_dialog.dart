import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_flutter_bloc/cubit/app_cubit.dart';
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
          groupValue: context.select<AppCubit, ThemeMode>((cubit) => cubit.state.themeMode),
          onChanged: context.read<AppCubit>().onSelectTheme,
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
