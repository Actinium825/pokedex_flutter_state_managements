import 'package:pokedex_flutter_bloc/apis/model/evolves_to.dart';

extension EvolvesToExt on EvolvesTo {
  String get speciesName => speciesInfo.name;
}
