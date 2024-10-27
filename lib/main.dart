import 'package:async_redux/async_redux.dart';
import 'package:device_preview_screenshot/device_preview_screenshot.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_flutter_async_redux/pokedex_app_connector.dart';
import 'package:pokedex_flutter_async_redux/state/action/actions.dart';
import 'package:pokedex_flutter_async_redux/state/app_state.dart';
import 'package:pokedex_flutter_async_redux/utils/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const state = AppState();
  final store = Store<AppState>(
    initialState: state,
    actionObservers: [if (kDebugMode) ConsoleActionObserver<AppState>()],
  );

  final prefs = await SharedPreferences.getInstance();
  final savedThemeIndex = prefs.getInt(themeSharedPrefsKey) ?? ThemeMode.system.index;
  final savedTheme = ThemeMode.values[savedThemeIndex];

  await store.dispatchAndWait(SetThemeAction(savedTheme));

  runApp(
    StoreProvider<AppState>(
      store: store,
      child: DevicePreview(builder: (_) => const PokedexAppConnector()),
    ),
  );
}
