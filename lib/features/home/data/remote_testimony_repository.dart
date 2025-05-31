import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio/features/home/data/testimony_repository.dart';
import 'package:portfolio/features/home/domain/testimony.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'remote_testimony_repository.g.dart';

class RemoteTestimonyRepository extends TestimonyRepository {
  final FirebaseFirestore db;

  RemoteTestimonyRepository(this.db);

  @override
  Future<List<Testimony>> getTestimonies() async {
    final data = await db
        .collection('testimonies')
        .get(const GetOptions(source: Source.serverAndCache));
    return data.docs.map((e) => Testimony.fromDoc(e)).toList();
  }
}

@Riverpod(keepAlive: true)
RemoteTestimonyRepository testimonyRepository(TestimonyRepositoryRef ref) {
  return RemoteTestimonyRepository(FirebaseFirestore.instance);
}

@Riverpod(keepAlive: true)
// ignore: deprecated_member_use_from_same_package
Future<List<Testimony>> getTestimonies(GetTestimoniesRef ref) {
  final projectsrepository = ref.watch(testimonyRepositoryProvider);
  return projectsrepository.getTestimonies();
}
