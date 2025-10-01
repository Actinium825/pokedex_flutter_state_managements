import 'package:pokedex_flutter_async_redux/apis/model/pokemon_type.dart';

extension PokemonTypeExt on PokemonType {
  String get name => typeInfo.name;
}
