import 'package:portfolio/features/experiences/data/domain/experience.dart';
import 'package:portfolio/features/experiences/data/experiences_repository.dart';
import 'package:portfolio/shared/api_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';

part 'remote_experiences_repository.g.dart';

class RemoteExperiencesRepository extends ExperiencesRepository {
  final ApiClient _api;
  RemoteExperiencesRepository({ApiClient? api}) : _api = api ?? ApiClient();

  @override
  Future<List<Experience>> getExperiences() async {
    try {
      final res = await _api.dio.get('/api/experiences');
      final data = (res.data as List).cast<Map<String, dynamic>>();
      return data.map(Experience.fromJson).toList();
    } on DioException catch (e) {
      throw Exception(
          'Failed to load experiences: ${e.response?.data ?? e.message}');
    }
  }
}

@Riverpod(keepAlive: true)
RemoteExperiencesRepository experiencesRepository(
    ExperiencesRepositoryRef ref) {
  return RemoteExperiencesRepository();
}

@Riverpod(keepAlive: true)
Future<List<Experience>> getExperiences(GetExperiencesRef ref) {
  final repository = ref.watch(experiencesRepositoryProvider);
  return repository.getExperiences();
}
