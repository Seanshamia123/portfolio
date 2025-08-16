import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio/features/experiences/data/domain/experience.dart';
import 'package:portfolio/features/experiences/data/experiences_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'remote_experiences_repository.g.dart';

class RemoteExperiencesRepository extends ExperiencesRepository {
  final FirebaseFirestore db;
  RemoteExperiencesRepository({required this.db});

  @override
  Future<List<Experience>> getExperiences() async {
    final experiences = await db
        .collection('experiences')
        .orderBy('date', descending: true)
        .get(const GetOptions(source: Source.serverAndCache));
    return experiences.docs.map((e) => Experience.fromDoc(e)).toList();
  }
}

@Riverpod(keepAlive: true)
RemoteExperiencesRepository experiencesRepository(
  ExperiencesRepositoryRef ref,
) {
  return RemoteExperiencesRepository(db: FirebaseFirestore.instance);
}

@Riverpod(keepAlive: true)
Future<List<Experience>> getExperiences(GetExperiencesRef ref) {
  final repository = ref.watch(experiencesRepositoryProvider);
  return repository.getExperiences();
}
