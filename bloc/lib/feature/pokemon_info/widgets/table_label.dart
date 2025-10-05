import 'package:flutter/material.dart';
import 'package:pokedex_flutter_bloc/utils/const.dart';
import 'package:pokedex_flutter_bloc/utils/extension.dart';

class TableLabel extends StatelessWidget {
  const TableLabel({
    required this.label,
    this.textAlign,
    super.key,
  });

  final String label;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return TableCell(
      child: Padding(
        padding: tableLabelPadding,
        child: Text(
          label,
          textAlign: textAlign,
          style: context.textTheme.bodyMedium,
        ),
      ),
    );
  }
}
