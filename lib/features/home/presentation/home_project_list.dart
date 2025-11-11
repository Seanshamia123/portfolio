import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/features/project/domain/project.dart';
import 'package:portfolio/features/project/presentation/home_project_card.dart';
import 'package:portfolio/widgets/gap_row.dart';
import 'package:portfolio/widgets/home_title_subtitle.dart';

class HomeProjectList extends StatelessWidget {
  const HomeProjectList({super.key, required this.projects});
  final List<Project> projects;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeTitleSubtitle(
          title: context.texts.projects,
          subtitle: context.texts.projectsDescription,
        ),
        const Gap(32),
        context.isDesktop
            ? _HomeProjectListDesktop(projects: projects)
            : _HomeProjectListPhone(projects: projects),
      ],
    );
  }
}

class _HomeProjectListDesktop extends StatelessWidget {
  const _HomeProjectListDesktop({required this.projects});
  final List<Project> projects;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final availableWidth = constraints.maxWidth;
          const minWidth = 320.0;
          const maxWidth = 420.0;
          const gap = 32.0;

          int columns = (availableWidth / (minWidth + gap)).floor();
          if (columns < 1) {
            columns = 1;
          } else if (columns > 3) {
            columns = 3;
          }

          final double calculatedWidth =
              (availableWidth - gap * (columns - 1)) / columns;
          final double cardWidth =
              calculatedWidth.clamp(minWidth, maxWidth).toDouble();

          return Align(
            alignment: Alignment.center,
            child: Wrap(
              spacing: gap,
              runSpacing: 32,
              alignment: WrapAlignment.center,
              children: projects
                  .map(
                    (project) => SizedBox(
                      width: cardWidth,
                      child: HomeProjectCard(project: project),
                    ),
                  )
                  .toList(),
            ),
          );
        },
      ),
    );
  }
}

class _HomeProjectListPhone extends StatelessWidget {
  const _HomeProjectListPhone({required this.projects});
  final List<Project> projects;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
        child: GapRow(
          gap: 16,
          children: projects
              .map(
                (e) => SizedBox(
                  width: context.mq.size.width * 0.75, // 75% of screen width
                  child: HomeProjectCard(project: e),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
