import 'package:portfolio/features/project/domain/project.dart';

abstract class ProjectsRepository {
  Future<List<Project>> getProjects();
}
