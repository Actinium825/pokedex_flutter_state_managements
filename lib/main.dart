import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_flutter_async_redux/pokedex_app.dart';
import 'package:pokedex_flutter_async_redux/state/action/actions.dart';
import 'package:pokedex_flutter_async_redux/state/app_state.dart';
import 'package:pokedex_flutter_async_redux/utils/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final state = const AppState();
  final store = Store<AppState>(initialState: state);

  final prefs = await SharedPreferences.getInstance();
  final savedThemeIndex = prefs.getInt(themeSharedPrefsKey) ?? ThemeMode.system.index;
  final savedTheme = ThemeMode.values[savedThemeIndex];

  await store.dispatchAndWait(SetThemeAction(savedTheme));

  runApp(
    StoreProvider<AppState>(
      store: store,
      child: const PokedexApp(),
    ),
  );
}
