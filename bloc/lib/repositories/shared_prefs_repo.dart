import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsRepo {
  static late final SharedPreferences prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }
}
