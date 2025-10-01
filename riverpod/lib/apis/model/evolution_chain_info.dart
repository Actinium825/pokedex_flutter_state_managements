import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_flutter_riverpod/utils/typedef.dart';

part 'evolution_chain_info.freezed.dart';
part 'evolution_chain_info.g.dart';

@freezed
abstract class EvolutionChainInfo with _$EvolutionChainInfo {
  const factory EvolutionChainInfo({
    @Default('') @JsonKey(name: 'url') String url,
  }) = _EvolutionChainInfo;

  factory EvolutionChainInfo.fromJson(Json json) => _$EvolutionChainInfoFromJson(json);
}
