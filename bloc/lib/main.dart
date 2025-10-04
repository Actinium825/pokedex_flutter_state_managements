import 'package:flutter/material.dart';
import 'package:pokedex_flutter_bloc/pokedex_app.dart';
import 'package:pokedex_flutter_bloc/repositories/app_router_repo.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  AppRouterRepo.init();

  runApp(const PokedexApp());
}
