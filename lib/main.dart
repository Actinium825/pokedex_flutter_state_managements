import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_flutter_async_redux/pokedex_app.dart';
import 'package:pokedex_flutter_async_redux/state/app_state.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final state = AppState();
  final store = Store<AppState>(initialState: state);

  runApp(
    StoreProvider<AppState>(
      store: store,
      child: const PokedexApp(),
    ),
  );
}
