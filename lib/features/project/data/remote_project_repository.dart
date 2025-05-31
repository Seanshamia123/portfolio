import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio/features/project/data/projects_repository.dart';
import 'package:portfolio/features/project/domain/project.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'remote_project_repository.g.dart';

class RemoteProjectRepository extends ProjectsRepository {
  final FirebaseFirestore db;

  RemoteProjectRepository({required this.db});

  @override
  Future<List<Project>> getProjects() async {
    try {
      final projects = await db
          .collection('projects')
          .get(const GetOptions(source: Source.serverAndCache));
      final projectList = projects.docs
          .map(
            (doc) => Project.fromDoc(doc),
          )
          .toList();
      return projectList;
    } catch (e) {
      rethrow;
    }
  }
}

@Riverpod(keepAlive: true)
RemoteProjectRepository projectsRepository(ProjectsRepositoryRef ref) {
  return RemoteProjectRepository(db: FirebaseFirestore.instance);
}

@Riverpod(keepAlive: true)
Future<List<Project>> getProjects(GetProjectsRef ref) {
  final repository = ref.read(projectsRepositoryProvider);
  return repository.getProjects();
}

// Run the build_runner command to generate the necessary files
// flutter pub run build_runner build --delete-conflicting-outputs
