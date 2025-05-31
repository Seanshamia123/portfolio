import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/style/app_size.dart';
import 'package:portfolio/widgets/styled_button.dart';

class LargeHeroButtons extends StatelessWidget {
  const LargeHeroButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PrimaryButton(title: context.texts.projects),
        Gap((Insets.lg)),
        OutlineButton(title: context.texts.downloadCV),
      ],
    );
  }
}

class SmallHeroButtons extends StatelessWidget {
  const SmallHeroButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: PrimaryButton(title: context.texts.projects),
        ),
        Gap((Insets.lg)),
        SizedBox(
          width: double.infinity,
          child: OutlineButton(title: context.texts.downloadCV),
        ),
      ],
    );
  }
}
