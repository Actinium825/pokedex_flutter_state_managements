import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_flutter_bloc/cubit/app_cubit.dart';
import 'package:pokedex_flutter_bloc/cubit/app_state.dart';
import 'package:pokedex_flutter_bloc/feature/pokemon_list/widgets/pokemon_card.dart';
import 'package:pokedex_flutter_bloc/utils/const.dart';
import 'package:pokedex_flutter_bloc/utils/extension.dart';
import 'package:pokedex_flutter_bloc/utils/strings.dart';

@RoutePage()
class PokemonListPage extends StatefulWidget {
  const PokemonListPage({super.key});

  @override
  State<PokemonListPage> createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  @override
  void initState() {
    context.read<AppCubit>().initPokemonListPage();
    super.initState();
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
      body: Padding(
        padding: pokemonListPagePadding,
        child: CustomScrollView(
          slivers: [
            BlocBuilder<AppCubit, AppState>(
              builder: (_, state) {
                final pokemonList = state.pokemonList;
                return SliverGrid(
                  gridDelegate: pokemonGridDelegate,
                  delegate: SliverChildBuilderDelegate(
                    (_, index) => PokemonCard(
                      pokemon: pokemonList[index],
                      // TODO: Add function
                      onTap: () {},
                    ),
                    childCount: pokemonList.length,
                  ),
                );
              },
            ),
            const SliverToBoxAdapter(child: SizedBox(height: pokemonListPageFooterHeight)),
          ],
        ),
      ),
    );
  }
}
