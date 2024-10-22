import 'package:dartx/dartx.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex_flutter_async_redux/feature/pokemon_list/widgets/pokemon_card.dart';
import 'package:pokedex_flutter_async_redux/model/union_page_state.dart';
import 'package:pokedex_flutter_async_redux/utils/const.dart';
import 'package:pokedex_flutter_async_redux/utils/extension.dart';
import 'package:pokedex_flutter_async_redux/utils/strings.dart';
import 'package:pokedex_flutter_async_redux/utils/typedef.dart';

class PokemonListPage extends StatefulWidget {
  const PokemonListPage({
    required this.savedThemeMode,
    required this.onSetTheme,
    required this.unionPageState,
    required this.onGetMorePokemon,
    required this.isGettingMorePokemon,
    required this.onRefreshPage,
    super.key,
  });

  final ThemeMode savedThemeMode;
  final ValueChanged<ThemeMode> onSetTheme;
  final UnionPageState<PokemonList> unionPageState;
  final VoidCallback onGetMorePokemon;
  final bool isGettingMorePokemon;
  final AsyncCallback onRefreshPage;

  @override
  State<PokemonListPage> createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController()..addListener(_onReachEnd);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

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
                  groupValue: widget.savedThemeMode,
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
    widget.onSetTheme(themeMode ?? ThemeMode.system);
    context.pop();
  }

  void _onReachEnd() {
    final position = _scrollController.position;
    if (position.pixels == position.maxScrollExtent) widget.onGetMorePokemon();
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
      body: RefreshIndicator(
        onRefresh: widget.onRefreshPage,
        child: Padding(
          padding: pokemonListPagePadding,
          child: widget.unionPageState.when(
            (pokemonList) => CustomScrollView(
              controller: _scrollController,
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
                if (widget.isGettingMorePokemon)
                  const SliverToBoxAdapter(
                    child: Center(
                      child: Padding(
                        padding: progressIndicatorFooterPadding,
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  )
                else
                  const SliverToBoxAdapter(child: SizedBox(height: pokemonListPageFooterHeight))
              ],
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (message) => AlertDialog(title: Text(message ?? '')),
          ),
        ),
      ),
    );
  }
}
