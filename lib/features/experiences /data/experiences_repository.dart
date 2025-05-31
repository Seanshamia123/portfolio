import 'package:portfolio/features/experiences%20/data/domain/experience.dart';

abstract class ExperiencesRepository {
  Future<List<Experience>> getExperiences();
}
