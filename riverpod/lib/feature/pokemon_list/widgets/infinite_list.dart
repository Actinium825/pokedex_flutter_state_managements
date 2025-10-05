import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_flutter_riverpod/apis/model/pokemon.dart';
import 'package:pokedex_flutter_riverpod/feature/pokemon_list/widgets/list_footer.dart';
import 'package:pokedex_flutter_riverpod/feature/pokemon_list/widgets/pokemon_card.dart';
import 'package:pokedex_flutter_riverpod/providers/pokemon_list_provider.dart';
import 'package:pokedex_flutter_riverpod/providers/search_result_list_provider.dart';
import 'package:pokedex_flutter_riverpod/providers/search_text_provider.dart';
import 'package:pokedex_flutter_riverpod/utils/const.dart';
import 'package:pokedex_flutter_riverpod/utils/strings.dart';
import 'package:pokedex_flutter_riverpod/widgets/loading_indicator.dart';

class InfiniteList extends ConsumerWidget {
  const InfiniteList({
    required this.scrollController,
    required this.onTapPokemonCard,
    super.key,
  });

  final ValueChanged<Pokemon> onTapPokemonCard;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchText = ref.watch(searchTextProvider);
    final pokemonListValue = searchText.isEmpty
        ? ref.watch(pokemonListRefProvider)
        : ref.watch(searchResultListProvider(searchText));

    return pokemonListValue.when(
      data: (pokemonList) => CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverGrid(
            gridDelegate: pokemonGridDelegate,
            delegate: SliverChildBuilderDelegate(
              (_, index) {
                final pokemon = pokemonList[index];
                return PokemonCard(
                  pokemon: pokemon,
                  onTap: () => onTapPokemonCard(pokemon),
                );
              },
              childCount: pokemonList.length,
            ),
          ),
          const ListFooter(),
        ],
      ),
      loading: LoadingIndicator.new,
      error: (_, _) => const AlertDialog(title: Text(emptyPokemonLabel)),
    );
  }
}
