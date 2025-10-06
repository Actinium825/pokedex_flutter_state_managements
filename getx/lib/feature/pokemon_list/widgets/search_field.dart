import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_getx/classes/adaptive_stateless_widget.dart';
import 'package:pokedex_getx/controller/app_controller.dart';
import 'package:pokedex_getx/utils/strings.dart';

class SearchField extends AdaptiveStatelessWidget {
  const SearchField({super.key});

  @override
  Widget buildAndroid(BuildContext context) {
    return TextField(
      autofocus: true,
      controller: Get.find<AppController>().textEditingController,
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
      controller: Get.find<AppController>().textEditingController,
      placeholder: searchFieldHintText,
      style: context.textTheme.bodyLarge,
      prefix: const Icon(Icons.search),
    );
  }
}
