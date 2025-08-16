import 'package:portfolio/features/project/data/projects_repository.dart';
import 'package:portfolio/features/project/domain/project.dart';
import 'package:portfolio/shared/api_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';

part 'remote_project_repository.g.dart';

class RemoteProjectRepository extends ProjectsRepository {
  final ApiClient _api;
  RemoteProjectRepository({ApiClient? api}) : _api = api ?? ApiClient();

  @override
  Future<List<Project>> getProjects() async {
    try {
      final res = await _api.dio.get('/api/projects');
      final data = (res.data as List).cast<Map<String, dynamic>>();
      return data.map(Project.fromJson).toList();
    } on DioException catch (e) {
      throw Exception(
          'Failed to load projects: ${e.response?.data ?? e.message}');
    }
  }
}

@Riverpod(keepAlive: true)
RemoteProjectRepository projectsRepository(ProjectsRepositoryRef ref) {
  return RemoteProjectRepository();
}

@Riverpod(keepAlive: true)
Future<List<Project>> getProjects(GetProjectsRef ref) {
  final repository = ref.read(projectsRepositoryProvider);
  return repository.getProjects();
}
