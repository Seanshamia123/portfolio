import 'package:flutter/material.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/widgets/seo_text.dart';
import 'package:seo_renderer/seo_renderer.dart';

class HomeTitleSubtitle extends StatelessWidget {
  const HomeTitleSubtitle({
    super.key,
    required this.title,
    required this.subtitle,
  });
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SEOText(
            title,
            style: context.textStyle.titleSmBold.copyWith(
              color: context.colorscheme.onSurface,
            ),
            textRendererStyle: TextRendererStyle.header3,
          ),
          SEOText(
            subtitle,
            style: context.textStyle.bodyMdMedium.copyWith(
              color: context.colorscheme.onSurface,
            ),
            textRendererStyle: TextRendererStyle.header4,
          ),
        ],
      ),
    );
  }
}
