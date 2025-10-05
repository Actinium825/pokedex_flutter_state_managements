import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_flutter_bloc/cubit/app_cubit.dart';
import 'package:pokedex_flutter_bloc/cubit/app_state.dart';
import 'package:pokedex_flutter_bloc/utils/const.dart';
import 'package:pokedex_flutter_bloc/utils/strings.dart';
import 'package:pokedex_flutter_bloc/widgets/loading_indicator.dart';

class ListFooter extends StatelessWidget {
  const ListFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      buildWhen: (previous, current) {
        final previousKey = previous.waitKey;
        final currentKey = current.waitKey;
        final isLoading = previousKey == '' && currentKey == getMorePokemonKey;
        final isDone = previousKey == getMorePokemonKey && currentKey == '';
        return isLoading || isDone;
      },
      builder: (_, state) => state.waitKey == getMorePokemonKey
          ? const SliverToBoxAdapter(
              child: Padding(
                padding: progressIndicatorFooterPadding,
                child: LoadingIndicator(),
              ),
            )
          : const SliverToBoxAdapter(child: SizedBox(height: pokemonListPageFooterHeight)),
    );
  }
}
