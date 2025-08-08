import 'package:flutter/material.dart';

import 'package:ammu_portfolio/themes/colors.dart';
import 'package:ammu_portfolio/resources/strings.dart';
import 'package:ammu_portfolio/themes/typography.dart';
import 'package:ammu_portfolio/widgets/common/base_layout.dart';

///[HomePage] is a widget that represents the home screen of the application.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return BaseLayout(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Hi! Im ${Strings.firstName} ✨',
                textAlign: TextAlign.center,
                style: Theme.of(
                  context,
                ).textTheme.displayLarge600?.copyWith(color: AppColors.white),
              ),
              SizedBox(height: 20),
              ShaderMask(
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    colors: [AppColors.blackRock, AppColors.purplePizzazz],
                  ).createShader(
                    Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                  );
                },
                child: Text(
                  Strings.role,
                  style: Theme.of(
                    context,
                  ).textTheme.headlineMedium600?.copyWith(
                    color: AppColors.white,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width:
                    screenSize.width > 850
                        ? screenSize.width * 0.5
                        : screenSize.width,
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
      ),
    );
  }
}
