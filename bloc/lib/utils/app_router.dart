import 'package:auto_route/auto_route.dart';
import 'package:pokedex_flutter_bloc/utils/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: PokemonListRoute.page,
      initial: true,
    ),
  ];
}
