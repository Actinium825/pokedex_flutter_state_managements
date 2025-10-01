import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_flutter_async_redux/model/dto/pokemon_dto.dart';

class PokemonImage extends StatelessWidget {
  const PokemonImage({
    required this.pokemon,
    required this.size,
    this.alignment = Alignment.center,
    this.tag,
    super.key,
  });

  final PokemonDto pokemon;
  final double size;
  final Alignment alignment;
  final Object? tag;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Hero(
        tag: tag ?? pokemon.id,
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: CachedNetworkImageProvider(pokemon.sprites.otherSprites.officialArtwork.imageUrl),
            ),
          ),
        ),
      ),
    );
  }
}
