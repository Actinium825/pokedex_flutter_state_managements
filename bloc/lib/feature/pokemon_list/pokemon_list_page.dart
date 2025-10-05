import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_flutter_bloc/cubit/app_cubit.dart';
import 'package:pokedex_flutter_bloc/cubit/app_state.dart';
import 'package:pokedex_flutter_bloc/feature/pokemon_list/widgets/pokemon_card.dart';
import 'package:pokedex_flutter_bloc/feature/pokemon_list/widgets/search_field.dart';
import 'package:pokedex_flutter_bloc/model/union_page_state.dart';
import 'package:pokedex_flutter_bloc/utils/app_router.gr.dart';
import 'package:pokedex_flutter_bloc/utils/const.dart';
import 'package:pokedex_flutter_bloc/utils/extension.dart';
import 'package:pokedex_flutter_bloc/utils/strings.dart';
import 'package:pokedex_flutter_bloc/utils/typedef.dart';
import 'package:pokedex_flutter_bloc/widgets/loading_indicator.dart';

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
  void dispose() {
    context.read<AppCubit>().disposePokemonListPage();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appCubit = context.read<AppCubit>();
    return Scaffold(
      appBar: AppBar(
        title: context.select<AppCubit, bool>((cubit) => cubit.state.isSearching)
            ? const SearchField()
            : Text(
                appTitle,
                style: context.textTheme.displayMedium,
              ),
        actions: [
          IconButton(
            onPressed: appCubit.onPressSearch,
            icon: Icon(context.select<AppCubit, bool>((cubit) => cubit.state.isSearching) ? Icons.close : Icons.search),
          ),
          IconButton(
            onPressed: appCubit.onRefresh,
            icon: const Icon(Icons.refresh),
          ),
          PopupMenuButton(
            onSelected: appCubit.onSelectOption,
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: chooseThemeMenuLabel,
                child: Text(chooseThemeMenuLabel),
              ),
            ],
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async => appCubit.onRefresh(),
        child: Padding(
          padding: pokemonListPagePadding,
          child: BlocBuilder<AppCubit, AppState>(
            builder: (context, _) => switch (appCubit.textEditingController.text.isNotEmpty
                ? appCubit.searchingState()
                : appCubit.pokemonListState()) {
              Data<PokemonList>(:final value) => CustomScrollView(
                controller: appCubit.scrollController,
                slivers: [
                  SliverGrid(
                    gridDelegate: pokemonGridDelegate,
                    delegate: SliverChildBuilderDelegate(
                      (_, index) {
                        final pokemon = value[index];
                        return PokemonCard(
                          pokemon: pokemon,
                          onTap: () => context.router.navigate(PokemonInfoRoute(selectedPokemon: pokemon)),
                        );
                      },
                      childCount: value.length,
                    ),
                  ),
                  if (context.select<AppCubit, String>((cubit) => cubit.state.waitKey) == getMorePokemonKey)
                    const SliverToBoxAdapter(
                      child: Padding(
                        padding: progressIndicatorFooterPadding,
                        child: LoadingIndicator(),
                      ),
                    )
                  else
                    const SliverToBoxAdapter(child: SizedBox(height: pokemonListPageFooterHeight)),
                ],
              ),
              Loading<PokemonList>() => const LoadingIndicator(),
              Error<PokemonList>(:final message) => AlertDialog(title: Text(message ?? '')),
            },
          ),
        ),
      ),
    );
  }
}
