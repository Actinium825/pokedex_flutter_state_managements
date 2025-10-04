import 'package:pokedex_flutter_bloc/apis/model/pokemon_type.dart';

extension PokemonTypeExt on PokemonType {
  String get name => typeInfo.name;
}
