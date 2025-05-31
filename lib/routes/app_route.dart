import 'package:go_router/go_router.dart';
import 'package:portfolio/features/contact/presentation/contact_page.dart';
import 'package:portfolio/features/home/presentation/home_page.dart';
import 'package:portfolio/features/project/presentation/projects_page.dart';

class Routes {
  static const String home = '/';
  static const String projects = '/projects';
  static const String contact = '/contact';
}

class AppRoute {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: Routes.home,
        pageBuilder: (context, state) => NoTransitionPage(child: HomePage()),
      ),
      GoRoute(
        path: Routes.projects,
        pageBuilder: (context, state) =>
            NoTransitionPage(child: ProjectsPage()),
      ),
      GoRoute(
        path: Routes.contact,
        pageBuilder: (context, state) => NoTransitionPage(child: ContactPage()),
      ),
    ],
  );
}
