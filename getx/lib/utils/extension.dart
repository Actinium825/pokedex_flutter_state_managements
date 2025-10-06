extension ListExt<T> on List<T> {
  List<E> forLoop<E>(E Function(T element) callback) {
    final result = <E>[];

    for (int index = 0; index < length; index++) {
      final mappedValue = callback(this[index]);
      result.add(mappedValue);
    }

    return result;
  }

  T firstWhereForLoop(bool Function(T element) test) {
    for (int i = 0; i < length; i++) {
      final element = this[i];
      if (test(element)) return element;
    }

    throw StateError('No element');
  }

  List<E> forLoopIndexed<E>(E Function(int index, T element) callback) {
    final result = <E>[];

    for (int index = 0; index < length; index++) {
      final mappedValue = callback(index, this[index]);
      result.add(mappedValue);
    }

    return result;
  }
}
