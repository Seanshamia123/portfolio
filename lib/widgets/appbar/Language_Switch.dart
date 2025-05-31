import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/Constants/app_icon.dart';
import 'package:portfolio/shared/app_locale_controller.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/widgets/seo_text.dart';

class LanguageSwitch extends ConsumerWidget {
  const LanguageSwitch({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final locale = ref.watch(applocaleControllerProvider);

    return PopupMenuButton(
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: 0,
            child: PopupLanguageSwitchItem(
              Language: 'English',
              icon: AppIcon.us,
            ),
          ),
          PopupMenuItem(
            value: 1,
            child: PopupLanguageSwitchItem(
              Language: 'Spanish',
              icon: AppIcon.es,
            ),
          ),
          PopupMenuItem(
            value: 2,
            child: PopupLanguageSwitchItem(
              Language: 'German',
              icon: AppIcon.de,
            ),
          ),
        ];
      },
      initialValue:
          locale.value == 'en'
              ? 0
              : locale.value == 'es'
              ? 1
              : 2,
      onSelected: (int value) {
        if (value == 0) {
          ref.read(applocaleControllerProvider.notifier).changeLocale('en');
        } else if (value == 1) {
          ref.read(applocaleControllerProvider.notifier).changeLocale('es');
        } else if (value == 2) {
          ref.read(applocaleControllerProvider.notifier).changeLocale('de');
        }
      },
      child: Row(
        children: [
          Icon(Icons.language, color: context.colorscheme.onSurface),
          const Gap(4),
          SEOText(
            locale.value == 'en'
                ? 'English'
                : locale.value == 'es'
                ? 'Spanish'
                : 'German',
          ),
        ],
      ),
    );
  }
}

class PopupLanguageSwitchItem extends StatelessWidget {
  const PopupLanguageSwitchItem({
    super.key,
    required this.Language,
    required this.icon,
  });
  final String Language;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(icon, width: 18, height: 18),
        const Gap(8),
        SEOText(Language),
      ],
    );
  }
}
