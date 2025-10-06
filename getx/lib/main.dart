import 'package:flutter/material.dart';
import 'package:pokedex_getx/classes/shared_prefs_repo.dart';
import 'package:pokedex_getx/pokedex_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPrefsRepo.init();

  runApp(const PokedexApp());
}
