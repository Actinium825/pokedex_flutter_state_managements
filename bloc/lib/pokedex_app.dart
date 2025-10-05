import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_flutter_bloc/cubit/app_cubit.dart';
import 'package:pokedex_flutter_bloc/cubit/app_state.dart';
import 'package:pokedex_flutter_bloc/repositories/app_router_repo.dart';
import 'package:pokedex_flutter_bloc/utils/themes.dart';

class PokedexApp extends StatelessWidget {
  const PokedexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppCubit>(
      create: (_) => AppCubit(),
      child: BlocBuilder<AppCubit, AppState>(
        buildWhen: (previous, current) => previous.themeMode != current.themeMode,
        builder: (_, state) => MaterialApp.router(
          debugShowCheckedModeBanner: false,
          themeMode: state.themeMode,
          theme: PokedexTheme.themeRegular,
          darkTheme: PokedexTheme.themeDark,
          routerConfig: AppRouterRepo.appRouter.config(
            navigatorObservers: () => [RouteObserver<ModalRoute<void>>()],
          ),
        ),
      ),
    );
  }
}
