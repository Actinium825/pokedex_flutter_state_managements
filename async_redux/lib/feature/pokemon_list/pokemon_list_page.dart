import 'dart:async';

import 'package:dartx/dartx.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex_flutter_async_redux/apis/model/pokemon.dart';
import 'package:pokedex_flutter_async_redux/feature/pokemon_info/pokemon_info_connector.dart';
import 'package:pokedex_flutter_async_redux/feature/pokemon_list/widgets/list_scaffold.dart';
import 'package:pokedex_flutter_async_redux/feature/pokemon_list/widgets/pokemon_card.dart';
import 'package:pokedex_flutter_async_redux/feature/pokemon_list/widgets/search_field.dart';
import 'package:pokedex_flutter_async_redux/feature/pokemon_list/widgets/theme_choice_dialog.dart';
import 'package:pokedex_flutter_async_redux/model/union_page_state.dart';
import 'package:pokedex_flutter_async_redux/utils/const.dart';
import 'package:pokedex_flutter_async_redux/utils/extension.dart';
import 'package:pokedex_flutter_async_redux/utils/strings.dart';
import 'package:pokedex_flutter_async_redux/utils/typedef.dart';
import 'package:pokedex_flutter_async_redux/widgets/loading_indicator.dart';

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
    required this.onSelectPokemon,
    super.key,
  });

  final ThemeMode savedThemeMode;
  final ValueChanged<ThemeMode> onSetTheme;
  final ValueChanged<String> onSearchPokemon;
  final ValueChanged<Pokemon> onSelectPokemon;
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

  void _showThemeChoiceDialog() => showDialog<void>(
        context: context,
        builder: (_) => ThemeChoiceDialog(
          savedThemeMode: widget.savedThemeMode,
          onSelectTheme: _onSelectTheme,
        ),
      );

  void _onSelectOption(String option) {
    if (option == chooseThemeMenuLabel) _showThemeChoiceDialog();
  }

  void _onSelectTheme(ThemeMode? themeMode) {
    widget.onSetTheme(themeMode ?? ThemeMode.system);
    context.pop();
  }

  void _onReachEnd() {
    final position = _scrollController.position;
    if (position.pixels == position.maxScrollExtent) widget.onGetMorePokemon();
  }

  void _onPressSearch() {
    _isSearchingNotifier.value = !_isSearchingNotifier.value;
    _onClearText();
  }

  void _onUpdateText() {
    _debouncer?.cancel();
    _debouncer = Timer(
      debouncerDelayInMilliseconds.milliseconds,
      () => widget.onSearchPokemon(_textEditingController.text),
    );
  }

  Future<void> _onRefresh() async {
    _onClearText();
    if (_isSearchingNotifier.value) _isSearchingNotifier.value = false;
    widget.onRefreshPage();
  }

  void _onClearText() {
    if (_textEditingController.text.isNotEmpty) _textEditingController.clear();
  }

  void _onTapPokemonCard(Pokemon selectedPokemon) {
    widget.onSelectPokemon(selectedPokemon);
    context.pushNamed(PokemonInfoConnector.route);
  }

  @override
  Widget build(BuildContext context) {
    return ListScaffold(
      appBarLeading: ValueListenableBuilder<bool>(
        valueListenable: _isSearchingNotifier,
        builder: (_, isSearching, __) => isSearching
            ? SearchField(textEditingController: _textEditingController)
            : Text(
                appTitle,
                style: context.textTheme.displayMedium,
              ),
      ),
      appBarActions: [
        IconButton(
          onPressed: _onPressSearch,
          icon: ValueListenableBuilder<bool>(
            valueListenable: _isSearchingNotifier,
            builder: (_, isSearching, __) => Icon(isSearching ? Icons.close : Icons.search),
          ),
        ),
        IconButton(
          onPressed: _onRefresh,
          icon: const Icon(Icons.refresh),
        ),
        PopupMenuButton(
          onSelected: _onSelectOption,
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
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: Padding(
          padding: pokemonListPagePadding,
          child: switch (_textEditingController.text.isNotEmpty ? widget.unionSearchPageState : widget.unionPageState) {
            Data<PokemonList>(:final value) => CustomScrollView(
                controller: _scrollController,
                slivers: [
                  SliverGrid(
                    gridDelegate: pokemonGridDelegate,
                    delegate: SliverChildBuilderDelegate(
                      (_, index) {
                        final pokemon = value[index];
                        return PokemonCard(
                          pokemon: pokemon,
                          onTap: () => _onTapPokemonCard(pokemon),
                        );
                      },
                      childCount: value.length,
                    ),
                  ),
                  if (widget.isGettingMorePokemon)
                    const SliverToBoxAdapter(
                      child: Padding(
                        padding: progressIndicatorFooterPadding,
                        child: LoadingIndicator(),
                      ),
                    )
                  else
                    const SliverToBoxAdapter(child: SizedBox(height: pokemonListPageFooterHeight))
                ],
              ),
            Loading<PokemonList>() => const LoadingIndicator(),
            Error<PokemonList>(:final message) => AlertDialog(title: Text(message ?? '')),
          },
        ),
      ),
    );
  }
}
