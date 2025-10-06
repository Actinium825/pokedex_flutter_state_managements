import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/app_controller.dart';
import 'package:getx/model/union_page_state.dart';
import 'package:getx/pokemon_list/widgets/pokemon_card.dart';
import 'package:getx/utils/const.dart';
import 'package:getx/utils/strings.dart';
import 'package:getx/utils/typedef.dart';
import 'package:getx/widgets/loading_indicator.dart';

class PokemonListPage extends StatefulWidget {
  const PokemonListPage({super.key});

  @override
  State<PokemonListPage> createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  late final _appController = Get.find<AppController>();

  @override
  void initState() {
    _appController.getInitialPokemonList();
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
            onSelected: _appController.onSelectOption,
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
        child: Obx(
          () => switch (_appController.pokemonListState()) {
            Data<PokemonList>(:final value) => CustomScrollView(
              slivers: [
                SliverGrid(
                  gridDelegate: pokemonGridDelegate,
                  delegate: SliverChildBuilderDelegate(
                    (_, index) => PokemonCard(
                      pokemon: value[index],
                      // TODO: Add function
                      onTap: () {},
                    ),
                    childCount: value.length,
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: pokemonListPageFooterHeight)),
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
