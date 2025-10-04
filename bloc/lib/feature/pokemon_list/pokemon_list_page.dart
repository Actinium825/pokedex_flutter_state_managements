import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_flutter_bloc/cubit/app_cubit.dart';
import 'package:pokedex_flutter_bloc/utils/extension.dart';
import 'package:pokedex_flutter_bloc/utils/strings.dart';

@RoutePage()
class PokemonListPage extends StatelessWidget {
  const PokemonListPage({super.key});

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
            onSelected: context.read<AppCubit>().onSelectOption,
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
