import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext {
  ThemeData get themeData => Theme.of(this);
}
