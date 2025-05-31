import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/widgets/app_scaffold.dart';
import 'package:portfolio/widgets/seo_text.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 100,
                  backgroundImage:
                      Image.asset('assets/images/about_picture.jpeg').image,
                ),
                const Gap(16),
                SEOText(
                  context.texts.contactPageTitle,
                  style: context.textStyle.titleSmBold,
                ),
                const Gap(16),
                SEOText(
                  context.texts.contactPageDescription,
                  style: context.textStyle.bodyLgMedium,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
