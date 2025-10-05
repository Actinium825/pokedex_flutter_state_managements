import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex_flutter_riverpod/feature/pokemon_info/pokemon_info_page.dart';
import 'package:pokedex_flutter_riverpod/feature/pokemon_list/pokemon_list_page.dart';

part 'router.g.dart';

final router = GoRouter(
  routes: $appRoutes,
  debugLogDiagnostics: kDebugMode,
  errorBuilder: (_, _) => const PokemonListPage(),
  observers: [RouteObserver<ModalRoute<void>>()],
);

@TypedGoRoute<PokemonListRoute>(
  path: '/',
  routes: [
    TypedGoRoute<PokemonInfoRoute>(
      path: 'pokemon-info',
    ),
  ],
)
class PokemonListRoute extends GoRouteData with $PokemonListRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const PokemonListPage();
  }
}

class PokemonInfoRoute extends GoRouteData with $PokemonInfoRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const PokemonInfoPage();
  }
}
