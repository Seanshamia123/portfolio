import 'package:portfolio/features/home/domain/testimony.dart';

abstract class TestimonyRepository {
  Future<List<Testimony>> getTestimonies();
  Future<void> submitReview({
    required String name,
    required String text,
    String? email,
    String? link,
  });
}
