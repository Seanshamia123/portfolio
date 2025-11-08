import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/features/project/domain/project.dart';
import 'package:portfolio/widgets/appbar/styled_card.dart';
import 'package:portfolio/widgets/seo_text.dart';
import 'package:portfolio/shared/app_locale_controller.dart';

class ProjectItem extends ConsumerWidget {
  const ProjectItem({super.key, required this.project});
  final Project project;
  @override
  Widget build(BuildContext context, ref) {
    return StyledCard(
      link: project.link,
      child: AspectRatio(
        aspectRatio: 0.7,
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1.5,
              child: ClipRRect(
                child: Image.network(project.imageUrl ?? '', fit: BoxFit.cover),
              ),
            ),
            const Gap(24),
            SEOText(
              project.title[ref.read(applocaleControllerProvider).value] ?? '',
              style: context.textStyle.titleLgBold.copyWith(
                color: context.colorscheme.onSurface,
              ),
              textRendererStyle: TextRendererStyle.header4,
            ),
            const Gap(8),
            Expanded(
              child: SEOText(
                project.description[
                        ref.read(applocaleControllerProvider).value] ??
                    '',
                style: context.textStyle.bodyMdMedium.copyWith(
                  color: context.colorscheme.onSurface,
                ),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
