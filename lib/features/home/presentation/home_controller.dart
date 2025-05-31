import 'package:portfolio/features/experiences%20/data/domain/experience.dart';
import 'package:portfolio/features/experiences%20/data/remote_experiences_repository.dart';
import 'package:portfolio/features/home/data/remote_testimony_repository.dart';
import 'package:portfolio/features/home/domain/testimony.dart';
import 'package:portfolio/features/project/data/remote_project_repository.dart';
import 'package:portfolio/features/project/domain/project.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_controller.g.dart';

@Riverpod(keepAlive: true)
class HomeController extends _$HomeController {
  @override
  Future<HomeState> build() async {
    final projects = await ref.watch(getProjectsProvider.future);
    final experiences = await ref.watch(getExperiencesProvider.future);
    final testimonies = await ref.watch(getTestimoniesProvider.future);
    return HomeState(
      projects: projects,
      experiences: experiences,
      testimonies: testimonies,
    );
  }
}

class HomeState {
  final List<Project> projects;
  final List<Experience> experiences;
  final List<Testimony> testimonies;

  HomeState({
    required this.experiences,
    required this.projects,
    required this.testimonies,
  });
}
