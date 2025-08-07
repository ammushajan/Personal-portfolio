import 'package:go_router/go_router.dart';

import 'package:personal_portfolio/screens/home.dart';
import 'package:personal_portfolio/screens/contact.dart';
import 'package:personal_portfolio/screens/projects.dart';

//[Routes] is a class that defines the routes for the application.
// It uses the GoRouter package to manage navigation within the app.
class Routes {
  Routes._();

  static const String home = '/';
  static const String about = '/about';
  static const String projects = '/projects';
  static const String contact = '/contact';

  static GoRouter get buildRoutes {
    return GoRouter(
      routes: [
        GoRoute(
          path: home,
          pageBuilder:
              (context, state) =>
                  const NoTransitionPage<void>(child: HomePage()),
        ),
        GoRoute(
          path: projects,
          pageBuilder:
              (context, state) =>
                  const NoTransitionPage<void>(child: ProjectScreen()),
        ),
        GoRoute(
          path: contact,
          pageBuilder:
              (context, state) =>
                  const NoTransitionPage<void>(child: ContactPage()),
        ),
      ],
    );
  }
}
