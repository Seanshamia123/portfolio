import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class GapRow extends StatelessWidget {
  const GapRow({super.key, required this.children, required this.gap});
  final List<Widget> children;
  final double gap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 0; i < children.length; i++) ...[
          children[i],
          if (i < children.length - 1) Gap(gap),
        ],
      ],
    );
  }
}
