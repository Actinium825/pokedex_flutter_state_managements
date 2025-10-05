import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_flutter_bloc/classes/adaptive_stateless_widget.dart';
import 'package:pokedex_flutter_bloc/cubit/app_cubit.dart';
import 'package:pokedex_flutter_bloc/utils/extension.dart';
import 'package:pokedex_flutter_bloc/utils/strings.dart';

class SearchField extends AdaptiveStatelessWidget {
  const SearchField({super.key});

  @override
  Widget buildAndroid(BuildContext context) {
    return TextField(
      autofocus: true,
      controller: context.read<AppCubit>().textEditingController,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.search),
        prefixIconConstraints: BoxConstraints(maxHeight: 20),
        hintText: searchFieldHintText,
      ),
    );
  }

  @override
  Widget buildIos(BuildContext context) {
    return CupertinoTextField(
      autofocus: true,
      controller: context.read<AppCubit>().textEditingController,
      placeholder: searchFieldHintText,
      style: context.textTheme.bodyLarge,
      prefix: const Icon(Icons.search),
    );
  }
}
