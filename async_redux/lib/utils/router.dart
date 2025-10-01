import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex_flutter_async_redux/feature/pokemon_info/pokemon_info_connector.dart';
import 'package:pokedex_flutter_async_redux/feature/pokemon_list/pokemon_list_connector.dart';

final navigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  routes: [
    GoRoute(
      path: PokemonListConnector.route,
      builder: (_, __) => const PokemonListConnector(),
      routes: [
        GoRoute(
          path: PokemonInfoConnector.route,
          name: PokemonInfoConnector.route,
          builder: (_, __) => const PokemonInfoConnector(),
        ),
      ],
    ),
  ],
  initialLocation: PokemonListConnector.route,
  debugLogDiagnostics: kDebugMode,
  errorBuilder: (_, __) => const PokemonListConnector(),
  observers: [routeObserver],
  navigatorKey: navigatorKey,
);

final routeObserver = RouteObserver<ModalRoute<void>>();
