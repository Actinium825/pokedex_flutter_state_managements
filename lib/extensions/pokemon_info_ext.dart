import 'package:pokedex_flutter_async_redux/apis/model/pokemon_info.dart';
import 'package:pokedex_flutter_async_redux/model/dto/pokemon_info_dto.dart';

extension PokemonInfoExt on PokemonInfo {
  PokemonInfoDto toDto() => PokemonInfoDto(
        detailsUrl: detailsUrl ?? '',
        name: name ?? '',
      );
}
