import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/extensions.dart';

class PoweredByFlutter extends StatelessWidget {
  const PoweredByFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/flutter.png',
            height: 24,
            color: context.colorscheme.onSurface,
          ),
          const Gap(8),
          Text(
            context.texts.poweredByFlutter,
            style: context.textStyle.bodyLgMedium.copyWith(
              color: context.colorscheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
