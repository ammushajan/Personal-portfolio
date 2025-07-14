import 'package:go_router/go_router.dart';

import 'package:personal_portfolio/screens/home.dart';

//[Routes] is a class that defines the routes for the application.
// It uses the GoRouter package to manage navigation within the app.
class Routes {
  Routes._();

  static const String home = '/';

  static GoRouter get buildRoutes {
    return GoRouter(
      routes: [
        GoRoute(path: home, builder: (context, state) => const HomePage()),
      ],
    );
  }
}
