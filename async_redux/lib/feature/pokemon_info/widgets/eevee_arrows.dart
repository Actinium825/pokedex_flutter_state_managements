import 'package:flutter/material.dart';
import 'package:pokedex_flutter_async_redux/utils/const.dart';
import 'package:pokedex_flutter_async_redux/utils/extension.dart';

class EeveeArrows extends StatelessWidget {
  const EeveeArrows({
    required this.pi,
    super.key,
  });

  final double pi;

  @override
  Widget build(BuildContext context) {
    final isTopArrows = pi.isNegative;
    return Padding(
      padding: EdgeInsets.only(
        bottom: isTopArrows ? 8 : 0,
        top: isTopArrows ? 0 : 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: eeveeArrowsDivisors.forLoop(
          (divisor) {
            return Transform.rotate(
              angle: pi / divisor,
              child: const Icon(Icons.arrow_circle_right),
            );
          },
        ).toList(),
      ),
    );
  }
}
