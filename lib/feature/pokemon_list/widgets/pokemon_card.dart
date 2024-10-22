import 'package:cached_network_image/cached_network_image.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_flutter_async_redux/extensions/pokemon_ext.dart';
import 'package:pokedex_flutter_async_redux/extensions/pokemon_type_ext.dart';
import 'package:pokedex_flutter_async_redux/feature/pokemon_list/widgets/pokemon_type_name.dart';
import 'package:pokedex_flutter_async_redux/model/dto/pokemon_dto.dart';
import 'package:pokedex_flutter_async_redux/utils/const.dart';
import 'package:pokedex_flutter_async_redux/utils/extension.dart';
import 'package:pokedex_flutter_async_redux/utils/pokemon_color_picker.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    required this.pokemon,
    required this.onTap,
    super.key,
  });

  final PokemonDto pokemon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final typeList = pokemon.typeList;
    final firstTypeName = typeList.firstOrNull?.name ?? '';

    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: PokemonColorPicker.getColor(firstTypeName),
        child: Stack(
          children: [
            Padding(
              padding: pokemonCardPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: pokemonNamePadding,
                    child: Text(
                      pokemon.name.capitalize(),
                      style: context.textTheme.headlineMedium,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PokemonTypeName(name: firstTypeName),
                      if (typeList.length > 1) PokemonTypeName(name: typeList.second.name),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 0.0,
              right: 0.0,
              child: Hero(
                tag: pokemon.id,
                child: Container(
                  width: pokemonCardSize,
                  height: pokemonCardSize,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: CachedNetworkImageProvider(pokemon.imageUrl)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
