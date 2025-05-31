import 'package:flutter/widgets.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/style/app_size.dart';
import 'package:flutter/material.dart';

class BackgroundBlur extends StatelessWidget {
  const BackgroundBlur({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: -(context.width / 2 / 2),
      top: (-(context.width / 2 / 2)) + Insets.xxxl,
      child: Container(
        width: context.width / 2,
        height: context.width / 2,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              blurRadius: 200,
              spreadRadius: 100,
              color: context.colorscheme.primary.withOpacity(0.4),
            ),
          ],
        ),
      ),
    );
  }
}
