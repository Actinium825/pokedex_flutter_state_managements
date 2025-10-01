import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_flutter_async_redux/classes/adaptive_stateless_widget.dart';
import 'package:pokedex_flutter_async_redux/utils/extension.dart';

class ListScaffold extends AdaptiveStatelessWidget {
  const ListScaffold({
    required this.appBarLeading,
    required this.appBarActions,
    required this.body,
    super.key,
  });

  final Widget appBarLeading;
  final Widget body;
  final List<Widget> appBarActions;

  @override
  Widget buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBarLeading,
        actions: appBarActions,
      ),
      body: body,
    );
  }

  @override
  Widget buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: context.themeData.scaffoldBackgroundColor,
        middle: Align(
          alignment: Alignment.centerLeft,
          child: appBarLeading,
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: appBarActions,
        ),
      ),
      child: SafeArea(child: body),
    );
  }
}
