import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/features/project/domain/project.dart';
import 'package:portfolio/features/project/presentation/projects_item.dart';
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
      child: GapRow(
        gap: 24,
        children: projects
            .map((e) => Expanded(child: ProjectItem(project: e)))
            .toList(),
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
        child: GapRow(
          gap: 24,
          children: projects
              .map(
                (e) => SizedBox(width: 240, child: ProjectItem(project: e)),
              )
              .toList(),
        ),
      ),
    );
  }
}
