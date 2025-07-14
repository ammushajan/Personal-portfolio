import 'package:flutter/material.dart';

import 'package:personal_portfolio/routes.dart';

/// [PortfoilioApp] is the main application widget that sets up the MaterialApp
/// with the router configuration.
class PortfoilioApp extends StatelessWidget {
  const PortfoilioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio App',
      routerConfig: Routes.buildRoutes,
    );
  }
}
