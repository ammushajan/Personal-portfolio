import 'package:flutter/material.dart';
import 'package:personal_portfolio/themes/colors.dart';
import 'package:personal_portfolio/resources/projects.dart';
import 'package:personal_portfolio/themes/typography.dart';
import 'package:personal_portfolio/widgets/common/base_layout.dart';

/// [ProjectScreen] is a placeholder screen for the projects section of the portfolio.
class ProjectScreen extends StatelessWidget {
  const ProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Text(
              ProjectStrings.projectsLabel,
              style: Theme.of(
                context,
              ).textTheme.headlineMedium600?.copyWith(color: AppColors.white),
            ),
            SizedBox(height: 20),
            Text(
              ProjectStrings.helperText,
              style: Theme.of(
                context,
              ).textTheme.labelLarge600?.copyWith(color: AppColors.white),
            ),
          ],
        ),
      ),
    );
  }
}
