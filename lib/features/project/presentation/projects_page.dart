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
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(48.0),
                child: CircularProgressIndicator(),
              ),
            ),
          )
        else if (projects.hasError)
          SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(48.0),
                child: Text('Error loading projects: ${projects.error}'),
              ),
            ),
          )
        else if (projects.value?.isEmpty ?? true)
          const SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(48.0),
                child: Text('No projects available'),
              ),
            ),
          )
        else
          SliverPadding(
            padding: EdgeInsets.all(context.insets.padding),
            sliver: SliverGrid.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 460,
                crossAxisSpacing: 32,
                mainAxisSpacing: 32,
                childAspectRatio: 0.68, // Increased vertical space
              ),
              itemBuilder: (context, index) {
                return ProjectItem(project: projects.value![index]);
              },
              itemCount: projects.value!.length,
            ),
          ),
      ],
    );
  }
}
