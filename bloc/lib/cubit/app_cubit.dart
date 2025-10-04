import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_flutter_bloc/cubit/app_state.dart';
import 'package:pokedex_flutter_bloc/feature/pokemon_list/widgets/theme_choice_dialog.dart';
import 'package:pokedex_flutter_bloc/repositories/app_router_repo.dart';
import 'package:pokedex_flutter_bloc/utils/strings.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState());

  void showThemeChoiceDialog() => showDialog<void>(
    context: AppRouterRepo.context,
    builder: (_) => const ThemeChoiceDialog(),
  );

  void onSelectOption(String option) {
    if (option == chooseThemeMenuLabel) showThemeChoiceDialog();
  }
}
