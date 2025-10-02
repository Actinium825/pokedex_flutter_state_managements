import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext {
  TextTheme get textTheme => themeData.textTheme;

  ThemeData get themeData => Theme.of(this);

  bool get isPortrait => MediaQuery.orientationOf(this) == Orientation.portrait;
}

extension ListExt<T> on List<T> {
  List<E> forLoopIndexed<E>(E Function(int index, T element) callback) {
    final result = <E>[];

    for (int index = 0; index < length; index++) {
      final mappedValue = callback(index, this[index]);
      result.add(mappedValue);
    }

    return result;
  }

  List<E> forLoop<E>(E Function(T element) callback) {
    final result = <E>[];

    for (int index = 0; index < length; index++) {
      final mappedValue = callback(this[index]);
      result.add(mappedValue);
    }

    return result;
  }

  T firstWhereForLoop(bool Function(T element) test) {
    for (int index = 0; index < length; index++) {
      final element = this[index];
      if (test(element)) return element;
    }

    throw StateError('No element');
  }
}
