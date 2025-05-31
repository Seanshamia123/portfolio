import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/Constants/app_icon.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/my_app_bar.dart';
import 'package:portfolio/widgets/powered_by_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MyFooter extends StatelessWidget {
  const MyFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.appBarTheme.backgroundColor,
      padding: EdgeInsets.all(context.insets.padding),
      child: Column(
        children: [
          context.isDesktop ? _DesktopFooter() : _PhoneFooter(),
          const Divider(height: 24),
          const PoweredByFlutter(),
        ],
      ),
    );
  }
}

class _PhoneFooter extends StatelessWidget {
  const _PhoneFooter();

  @override
  Widget build(BuildContext context) {
    return Column(children: [Applogo(), SmallMenu(), _FooterLinks()]);
  }
}

class _DesktopFooter extends StatelessWidget {
  const _DesktopFooter();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Applogo(), Spacer(), LargeMenu(), Spacer(), _FooterLinks()],
    );
  }
}

class _FooterLinks extends StatelessWidget {
  const _FooterLinks();
  final String instagramUrl =
      'https://www.instagram.com/_shami.a_?igsh=bWJ5c3h4aDl3b3dk&utm_source=qr';
  final String linkedinUrl =
      'https://www.linkedin.com/in/sean-paul-shamia-48a327333?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=ios_app';
  final String githubUrl = 'https://github.com/Seanshamia123';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _FooterLinkItem(
            onPressed: () => launchUrl((Uri.parse(instagramUrl))),
            icon: AppIcon.instagram),
        _FooterLinkItem(
            onPressed: () => launchUrl((Uri.parse(linkedinUrl))),
            icon: AppIcon.linkedin),
        _FooterLinkItem(
            onPressed: () => launchUrl((Uri.parse(githubUrl))),
            icon: AppIcon.github),
      ],
    );
  }
}

class _FooterLinkItem extends StatelessWidget {
  const _FooterLinkItem({required this.icon, required this.onPressed});
  final VoidCallback onPressed;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: SvgPicture.asset(
        icon,
        colorFilter: ColorFilter.mode(
          context.colorscheme.onSurface,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
