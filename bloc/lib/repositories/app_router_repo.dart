import 'package:flutter/material.dart';
import 'package:pokedex_flutter_bloc/utils/app_router.dart';

class AppRouterRepo {
  static late final AppRouter appRouter;

  static void init() {
    appRouter = AppRouter();
  }

  static BuildContext get context {
    return appRouter.navigatorKey.currentContext ?? (throw 'No Context');
  }
}
