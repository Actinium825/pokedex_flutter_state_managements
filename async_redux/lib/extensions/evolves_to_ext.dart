import 'package:pokedex_flutter_async_redux/apis/model/evolves_to.dart';
import 'package:pokedex_flutter_async_redux/extensions/pokemon_info_ext.dart';
import 'package:pokedex_flutter_async_redux/model/dto/evolves_to_dto.dart';
import 'package:pokedex_flutter_async_redux/model/dto/pokemon_info_dto.dart';

extension EvolvesToExt on EvolvesTo {
  EvolvesToDto toDto() => EvolvesToDto(
        speciesInfo: speciesInfo?.toDto() ?? const PokemonInfoDto(),
        evolutions: [...?evolutions?.map((evolution) => evolution.toDto())],
      );
}

extension EvolvesToDtoExt on EvolvesToDto {
  String get speciesName => speciesInfo.name;
}
