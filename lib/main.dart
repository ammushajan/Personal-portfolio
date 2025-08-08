import 'package:flutter/material.dart';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'package:ammu_portfolio/app.dart';

void main() {
  usePathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const PortfoilioApp());
}
