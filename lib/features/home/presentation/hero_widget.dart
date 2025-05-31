import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart' show Gap;
import 'package:portfolio/extensions.dart';
import 'package:portfolio/features/home/presentation/hero_buttons.dart';
import 'package:portfolio/features/home/presentation/hero_image.dart';
import 'package:portfolio/features/home/presentation/hero_texts.dart';
import 'package:portfolio/style/app_size.dart';
import 'package:portfolio/widgets/powered_by_flutter.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PoweredByFlutter(),
        context.isDesktop || context.isTablet
            ? const _LargeHero()
            : const _SmallHero(),
      ],
    );
  }
}

class _SmallHero extends StatelessWidget {
  const _SmallHero();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 140),
          child: const HeroImage(),
        ),
        Gap(Insets.xl),
        const HeroTexts(),
        Gap(Insets.xxl),
        const SmallHeroButtons(),
      ],
    );
  }
}

class _LargeHero extends StatelessWidget {
  const _LargeHero();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: const HeroImage()),
        Gap(Insets.xl),
        Expanded(
          flex: 2,
          child: Column(
            children: [
              const HeroTexts(),
              Gap(Insets.xxl),
              const LargeHeroButtons(),
            ],
          ),
        ),
      ],
    );
  }
}
