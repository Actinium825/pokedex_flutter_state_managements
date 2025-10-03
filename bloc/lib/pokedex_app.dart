import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_flutter_bloc/cubit/app_cubit.dart';
import 'package:pokedex_flutter_bloc/utils/app_router.dart';
import 'package:pokedex_flutter_bloc/utils/themes.dart';

class PokedexApp extends StatefulWidget {
  const PokedexApp({super.key});

  @override
  State<PokedexApp> createState() => _PokedexAppState();
}

class _PokedexAppState extends State<PokedexApp> {
  late final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppCubit>(
      create: (_) => AppCubit(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: PokedexTheme.themeRegular,
        routerConfig: _appRouter.config(
          navigatorObservers: () => [RouteObserver<ModalRoute<void>>()],
        ),
      ),
    );
  }
}
