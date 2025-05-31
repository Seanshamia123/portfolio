import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/features/project/data/remote_project_repository.dart';
import 'package:portfolio/features/project/presentation/projects_item.dart';
import 'package:portfolio/widgets/app_scaffold.dart';

class ProjectsPage extends ConsumerWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final projects = ref.watch(getProjectsProvider);
    return AppScaffold(
      slivers: [
        if (projects.isLoading)
          const SliverToBoxAdapter(
            child: CircularProgressIndicator(),
          )
        else
          SliverPadding(
            padding: EdgeInsets.all(context.insets.padding),
            sliver: SliverGrid.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: context.mq.size.width ~/ 300 >= 3
                    ? 3
                    : context.mq.size.width ~/ 300,
                crossAxisSpacing: 24,
                mainAxisSpacing: 24,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (context, index) {
                return ProjectItem(project: projects.value![index]);
              },
              itemCount: projects
                  .value!.length, // Adjust the number of items as needed
            ),
          ),
      ],
    );
  }
}
