import 'package:flutter/material.dart';

import 'package:personal_portfolio/themes/colors.dart';
import 'package:personal_portfolio/resources/strings.dart';
import 'package:personal_portfolio/themes/typography.dart';
import 'package:personal_portfolio/widgets/common/base_layout.dart';

///[HomePage] is a widget that represents the home screen of the application.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return BaseLayout(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              Strings.name,
              style: Theme.of(
                context,
              ).textTheme.displayLarge500?.copyWith(color: AppColors.white),
            ),
            SizedBox(height: 20),
            ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback:
                  (bounds) => LinearGradient(
                    colors: [AppColors.white, AppColors.black],
                  ).createShader(
                    Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                  ),
              child: Text(
                Strings.role,
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: AppColors.white,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: screenSize.width * 0.4,
              child: Text(
                Strings.description,
                textAlign: TextAlign.center,
                style: Theme.of(
                  context,
                ).textTheme.headlineSmall?.copyWith(color: AppColors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
