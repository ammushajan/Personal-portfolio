import 'package:flutter/material.dart';
import 'package:ammu_portfolio/themes/colors.dart';

import 'package:ammu_portfolio/widgets/common/header.dart';

/// [BaseLayout] is a widget that provides a common layout structure for the application.
/// It includes an app bar and a body that can be customized with different widgets.
class BaseLayout extends StatelessWidget {
  final Widget child;
  final int currentIndex;
  final List<Color>? gradientColors;
  const BaseLayout({
    super.key,
    required this.child,
    this.gradientColors,
    this.currentIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 200.0),
        child: Header(currentIndex: currentIndex),
      ),
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
