import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_getx/controller/app_controller.dart';
import 'package:pokedex_getx/feature/pokemon_list/pokemon_list_page.dart';
import 'package:pokedex_getx/utils/themes.dart';

class PokedexApp extends StatelessWidget {
  const PokedexApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appController = Get.put(AppController());
    return Obx(
      () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: appController.themeMode.value,
        theme: PokedexTheme.themeRegular,
        darkTheme: PokedexTheme.themeDark,
        home: const PokemonListPage(),
      ),
    );
  }
}
