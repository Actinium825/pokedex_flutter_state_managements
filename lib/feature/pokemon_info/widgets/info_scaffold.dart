import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_flutter_async_redux/classes/adaptive_stateless_widget.dart';

class InfoScaffold extends AdaptiveStatelessWidget {
  const InfoScaffold({
    required this.child,
    required this.color,
    super.key,
  });

  final Color color;
  final Widget child;

  @override
  Widget buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: color),
      backgroundColor: color,
      body: child,
    );
  }

  @override
  Widget buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: color,
        border: const Border(),
      ),
      backgroundColor: color,
      child: child,
    );
  }
}
