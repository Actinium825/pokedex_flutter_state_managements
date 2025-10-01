import 'package:pokedex_flutter_async_redux/apis/model/evolution_chain_info.dart';
import 'package:pokedex_flutter_async_redux/model/dto/evolution_chain_info_dto.dart';

extension EvolutionChainInfoExt on EvolutionChainInfo {
  EvolutionChainInfoDto toDto() => EvolutionChainInfoDto(url: url ?? '');
}
