import 'package:portfolio/features/experiences/data/domain/experience.dart';

abstract class ExperiencesRepository {
  Future<List<Experience>> getExperiences();
}
