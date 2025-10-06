import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/app_controller.dart';
import 'package:getx/utils/extension.dart';
import 'package:getx/utils/strings.dart';

class ThemeChoiceDialog extends StatelessWidget {
  const ThemeChoiceDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final appController = Get.find<AppController>();
    return AlertDialog.adaptive(
      title: const Text(chooseThemeMenuLabel),
      content: Material(
        color: Colors.transparent,
        child: RadioGroup<ThemeMode>(
          groupValue: appController.themeMode.value,
          onChanged: appController.onSelectTheme,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: ThemeMode.values.forLoop(
              (themeMode) => RadioListTile.adaptive(
                title: Text(themeMode.name.capitalize ?? ''),
                value: themeMode,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
