import 'package:flutter/material.dart';
import 'package:personal_portfolio/themes/colors.dart';

import 'package:personal_portfolio/widgets/common/header.dart';

/// [BaseLayout] is a widget that provides a common layout structure for the application.
/// It includes an app bar and a body that can be customized with different widgets.
class BaseLayout extends StatelessWidget {
  final Widget child;
  final List<Color>? gradientColors;
  const BaseLayout({super.key, required this.child, this.gradientColors});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors:
                gradientColors ??
                [AppColors.purplePizzazz, AppColors.cyan, AppColors.blackRock],
            stops: const [0.0, 0.8, 1.0],
          ),
        ),
        child: child,
      ),
      backgroundColor: Colors.transparent,
    );
  }
}
