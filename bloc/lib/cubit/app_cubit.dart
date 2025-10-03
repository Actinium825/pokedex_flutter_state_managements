import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_flutter_bloc/cubit/app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState());
}
