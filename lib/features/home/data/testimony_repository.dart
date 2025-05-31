import 'package:portfolio/features/home/domain/testimony.dart';

abstract class TestimonyRepository {
  Future<List<Testimony>> getTestimonies();
}
