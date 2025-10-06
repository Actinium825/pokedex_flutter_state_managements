import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_getx/controller/app_controller.dart';
import 'package:pokedex_getx/feature/pokemon_info/pokemon_info_page.dart';
import 'package:pokedex_getx/feature/pokemon_list/widgets/list_scaffold.dart';
import 'package:pokedex_getx/feature/pokemon_list/widgets/pokemon_card.dart';
import 'package:pokedex_getx/feature/pokemon_list/widgets/search_field.dart';
import 'package:pokedex_getx/model/union_page_state.dart';
import 'package:pokedex_getx/utils/const.dart';
import 'package:pokedex_getx/utils/strings.dart';
import 'package:pokedex_getx/utils/typedef.dart';
import 'package:pokedex_getx/widgets/loading_indicator.dart';

class PokemonListPage extends StatefulWidget {
  const PokemonListPage({super.key});

  @override
  State<PokemonListPage> createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  late final _appController = Get.find<AppController>();

  @override
  void initState() {
    _appController.initPokemonListPage();
    super.initState();
  }

  @override
  void dispose() {
    _appController.disposePokemonListPage();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListScaffold(
      appBarLeading: Obx(
        () => switch (_appController.isSearching.value) {
          true => const SearchField(),
          false => Text(
            appTitle,
            style: context.textTheme.displayMedium,
          ),
        },
      ),
      appBarActions: [
        IconButton(
          onPressed: _appController.onPressSearch,
          icon: Obx(() => Icon(_appController.isSearching.value ? Icons.close : Icons.search)),
        ),
        IconButton(
          onPressed: _appController.onRefresh,
          icon: const Icon(Icons.refresh),
        ),
        PopupMenuButton(
          onSelected: _appController.onSelectOption,
          itemBuilder: (_) => [
            const PopupMenuItem(
              value: chooseThemeMenuLabel,
              child: Text(chooseThemeMenuLabel),
            ),
          ],
        ),
      ],
      body: RefreshIndicator(
        onRefresh: () async => _appController.onRefresh(),
        child: Padding(
          padding: pokemonListPagePadding,
          child: Obx(
            () => switch (_appController.textEditingController.text.isNotEmpty
                ? _appController.searchingState()
                : _appController.pokemonListState()) {
              Data<PokemonList>(:final value) => CustomScrollView(
                controller: _appController.scrollController,
                slivers: [
                  SliverGrid(
                    gridDelegate: pokemonGridDelegate,
                    delegate: SliverChildBuilderDelegate(
                      (_, index) {
                        final pokemon = value[index];
                        return PokemonCard(
                          pokemon: pokemon,
                          onTap: () => Get.to(PokemonInfoPage(selectedPokemon: pokemon)),
                        );
                      },
                      childCount: value.length,
                    ),
                  ),
                  if (_appController.waitKey.value == getMorePokemonKey)
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
