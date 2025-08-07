import 'package:flutter/material.dart';

import 'package:personal_portfolio/themes/colors.dart';
import 'package:personal_portfolio/resources/projects.dart';
import 'package:personal_portfolio/themes/typography.dart';
import 'package:personal_portfolio/widgets/common/base_layout.dart';
import 'package:personal_portfolio/widgets/projects/project_listing.dart';

/// [ProjectScreen] is a placeholder screen for the projects section of the portfolio.
class ProjectScreen extends StatelessWidget {
  const ProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return BaseLayout(
      currentIndex: 1,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ProjectStrings.projectsLabel,
                style: Theme.of(context).textTheme.headlineMedium600?.copyWith(
                  color: AppColors.blackRock,
                ),
              ),
              SizedBox(height: 20),
              Text(
                ProjectStrings.helperText,
                style: Theme.of(
                  context,
                ).textTheme.labelLarge600?.copyWith(color: AppColors.blackRock),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenSize.width * 0.1,
                  vertical: 40.0,
                ),
                child: ProjectListing(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
