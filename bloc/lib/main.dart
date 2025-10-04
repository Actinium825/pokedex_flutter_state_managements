import 'package:flutter/material.dart';
import 'package:pokedex_flutter_bloc/pokedex_app.dart';
import 'package:pokedex_flutter_bloc/repositories/app_router_repo.dart';
import 'package:pokedex_flutter_bloc/repositories/shared_prefs_repo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPrefsRepo.init();
  AppRouterRepo.init();

  runApp(const PokedexApp());
}
