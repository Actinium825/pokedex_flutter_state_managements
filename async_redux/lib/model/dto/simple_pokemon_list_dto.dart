import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_flutter_async_redux/model/dto/simple_pokemon_dto.dart';

part 'simple_pokemon_list_dto.freezed.dart';

@freezed
abstract class SimplePokemonListDto with _$SimplePokemonListDto {
  const factory SimplePokemonListDto({
    @Default('') String next,
    @Default(<SimplePokemonDto>[]) List<SimplePokemonDto> simplePokemonList,
  }) = _SimplePokemonListDto;
}
