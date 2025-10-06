import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/app_controller.dart';
import 'package:getx/pokemon_list/widgets/pokemon_card.dart';
import 'package:getx/utils/const.dart';
import 'package:getx/utils/strings.dart';

class PokemonListPage extends StatefulWidget {
  const PokemonListPage({super.key});

  @override
  State<PokemonListPage> createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  @override
  void initState() {
    Get.find<AppController>().getInitialPokemonList();
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
            onSelected: Get.find<AppController>().onSelectOption,
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
            Obx(
              () {
                final pokemonList = Get.find<AppController>().pokemonList;
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
