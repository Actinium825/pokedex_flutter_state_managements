import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_flutter_async_redux/state/app_state.dart';
import 'package:pokedex_flutter_async_redux/utils/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Change the state's theme with the selected [themeMode]
/// Additionally save the selected [themeMode] to shared prefs
/// Don't dispatch if state's saved theme is the same as the selected
class SetThemeAction extends ReduxAction<AppState> {
  SetThemeAction(this.themeMode);

  final ThemeMode themeMode;

  @override
  bool abortDispatch() => state.savedThemeMode == themeMode;

  @override
  Future<AppState> reduce() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(themeSharedPrefsKey, themeMode.index);

    return state.copyWith(savedThemeMode: themeMode);
  }
}
