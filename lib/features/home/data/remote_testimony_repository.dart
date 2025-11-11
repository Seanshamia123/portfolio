import 'package:portfolio/features/home/data/testimony_repository.dart';
import 'package:portfolio/features/home/domain/testimony.dart';
import 'package:portfolio/shared/api_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';

part 'remote_testimony_repository.g.dart';

class RemoteTestimonyRepository extends TestimonyRepository {
  final ApiClient _api;
  RemoteTestimonyRepository([ApiClient? api]) : _api = api ?? ApiClient();

  @override
  Future<List<Testimony>> getTestimonies() async {
    try {
      final res = await _api.dio.get('/api/testimonies');
      final data = (res.data as List).cast<Map<String, dynamic>>();
      return data.map(Testimony.fromJson).toList();
    } on DioException catch (e) {
      throw Exception(
          'Failed to load testimonies: ${e.response?.data ?? e.message}');
    }
  }

  @override
  Future<void> submitReview({
    required String name,
    required String text,
    String? email,
    String? link,
  }) async {
    try {
      await _api.dio.post('/api/testimonies/submit', data: {
        'name': name,
        'text': text,
        if (email != null && email.isNotEmpty) 'email': email,
        if (link != null && link.isNotEmpty) 'link': link,
      });
    } on DioException catch (e) {
      final errorMsg = e.response?.data?['error'] ?? e.message;
      throw Exception('Failed to submit review: $errorMsg');
    }
  }
}

@Riverpod(keepAlive: true)
RemoteTestimonyRepository testimonyRepository(TestimonyRepositoryRef ref) {
  return RemoteTestimonyRepository();
}

@Riverpod(keepAlive: true)
// ignore: deprecated_member_use_from_same_package
Future<List<Testimony>> getTestimonies(GetTestimoniesRef ref) {
  final repo = ref.watch(testimonyRepositoryProvider);
  return repo.getTestimonies();
}
