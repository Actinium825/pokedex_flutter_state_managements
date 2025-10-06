import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

abstract class AdaptiveStatelessWidget extends StatelessWidget {
  const AdaptiveStatelessWidget({super.key});

  Widget buildAndroid(BuildContext context);

  Widget buildIos(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return GetPlatform.isAndroid ? buildAndroid(context) : buildIos(context);
  }
}
