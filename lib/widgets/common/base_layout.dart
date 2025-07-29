import 'package:flutter/material.dart';

import 'package:personal_portfolio/widgets/common/header.dart';

/// [BaseLayout] is a widget that provides a common layout structure for the application.
/// It includes an app bar and a body that can be customized with different widgets.
class BaseLayout extends StatelessWidget {
  final Widget child;
  const BaseLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: Header(), body: child);
  }
}
