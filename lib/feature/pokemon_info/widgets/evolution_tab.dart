import 'package:flutter/material.dart';
import 'package:pokedex_flutter_async_redux/extensions/pokemon_evolution_chain_ext.dart';
import 'package:pokedex_flutter_async_redux/feature/pokemon_info/widgets/evolution_card.dart';
import 'package:pokedex_flutter_async_redux/model/dto/pokemon_evolution_chain_dto.dart';
import 'package:pokedex_flutter_async_redux/utils/const.dart';
import 'package:pokedex_flutter_async_redux/utils/typedef.dart';

class EvolutionTab extends StatelessWidget {
  const EvolutionTab({
    required this.pokemonEvolutionChain,
    required this.pokemonEvolutionList,
    super.key,
  });

  final PokemonList pokemonEvolutionList;
  final PokemonEvolutionChainDto pokemonEvolutionChain;

  void _replaceWidget(List<Widget> children, List<int> gridIndices, int pokemonIndex) {
    for (final gridIndex in gridIndices) {
      children
        ..removeAt(gridIndex)
        ..insert(gridIndex, EvolutionCard(pokemon: pokemonEvolutionList[pokemonIndex++]));
    }
  }

  void _handleEeveeCase(List<Widget> children) => children
    ..replaceRange(
      0,
      pokemonEvolutionList.length,
      pokemonEvolutionList.sublist(1).map((pokemon) => EvolutionCard(pokemon: pokemon)),
    )
    ..insert(4, EvolutionCard(pokemon: pokemonEvolutionList.first));

  void _updateGrid(List<Widget> children) {
    int index = 0;

    // No Evolution
    if (pokemonEvolutionList.length == 1) {
      _replaceWidget(children, [4], index++);
      // Only Stage 2 Evolution
    } else if (pokemonEvolutionChain.stage3Evolutions.isEmpty) {
      _replaceWidget(children, [3], index++);

      // Number of Stage 2 Evolutions
      switch (pokemonEvolutionChain.stage2Evolutions.length) {
        case 1:
          _replaceWidget(children, [5], index++);
        case 2:
          _replaceWidget(children, [2, 8], index++);
        case 3:
          _replaceWidget(children, [2, 5, 8], index++);
        case 8:
          _handleEeveeCase(children);
      }
      // Stage 3 Evolutions
    } else {
      _replaceWidget(children, [3], index++);

      // Number of Stage 2 Evolutions
      switch (pokemonEvolutionChain.stage2Evolutions.length) {
        case 1:
          _replaceWidget(children, [4], index++);
        case 2:
          _replaceWidget(children, [1, 7], index++);
        case 3:
          _replaceWidget(children, [1, 4, 7], index++);
      }

      // Number of Stage 3 Evolutions
      switch (pokemonEvolutionChain.stage3Evolutions.length) {
        case 1:
          _replaceWidget(children, [5], index++);
        case 2:
          _replaceWidget(children, [2, 8], index++);
        case 3:
          _replaceWidget(children, [2, 5, 8], index++);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final children = List<Widget>.generate(evolutionGridCount, (_) => const SizedBox());
    _updateGrid(children);
    return Padding(
      padding: evolutionTabMargin,
      child: GridView.count(
        crossAxisCount: evolutionGridCrossAxisCount,
        children: children,
      ),
    );
  }
}
