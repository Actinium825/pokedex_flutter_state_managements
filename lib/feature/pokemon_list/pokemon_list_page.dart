import 'dart:async';

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
    required this.unionSearchPageState,
    required this.onGetMorePokemon,
    required this.isGettingMorePokemon,
    required this.onRefreshPage,
    required this.onSearchPokemon,
    super.key,
  });

  final ThemeMode savedThemeMode;
  final ValueChanged<ThemeMode> onSetTheme;
  final ValueChanged<String> onSearchPokemon;
  final UnionPageState<PokemonList> unionPageState;
  final UnionPageState<PokemonList> unionSearchPageState;
  final VoidCallback onGetMorePokemon;
  final AsyncCallback onRefreshPage;
  final bool isGettingMorePokemon;

  @override
  State<PokemonListPage> createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  late final ScrollController _scrollController;
  late final TextEditingController _textEditingController;
  late final ValueNotifier<bool> _isSearchingNotifier;
  Timer? _debouncer;

  @override
  void initState() {
    _scrollController = ScrollController()..addListener(_onReachEnd);
    _textEditingController = TextEditingController()..addListener(_onUpdateText);
    _isSearchingNotifier = ValueNotifier(false);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _textEditingController.dispose();
    _isSearchingNotifier.dispose();
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

  void _onPressSearch() {
    _isSearchingNotifier.value = !_isSearchingNotifier.value;
    if (_textEditingController.text.isNotEmpty) _textEditingController.clear();
  }

  void _onUpdateText() {
    _debouncer?.cancel();
    _debouncer = Timer(
      debouncerDelayInMilliseconds.milliseconds,
      () => widget.onSearchPokemon(_textEditingController.text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ValueListenableBuilder<bool>(
          valueListenable: _isSearchingNotifier,
          builder: (_, isSearching, __) => isSearching
              ? TextField(
                  autofocus: true,
                  controller: _textEditingController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    prefixIconConstraints: BoxConstraints(maxHeight: 20),
                    hintText: searchFieldHintText,
                  ),
                )
              : Text(
                  appTitle,
                  style: context.textTheme.displayMedium,
                ),
        ),
        actions: [
          IconButton(
            onPressed: _onPressSearch,
            icon: ValueListenableBuilder<bool>(
              valueListenable: _isSearchingNotifier,
              builder: (_, isSearching, __) => Icon(isSearching ? Icons.close : Icons.search),
            ),
          ),
          IconButton(
            onPressed: widget.onRefreshPage,
            icon: const Icon(Icons.refresh),
          ),
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
          child: (_textEditingController.text.isNotEmpty ? widget.unionSearchPageState : widget.unionPageState).when(
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
