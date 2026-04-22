import 'package:flutter/material.dart';

import 'package:ammu_portfolio/themes/colors.dart';
import 'package:ammu_portfolio/resources/projects.dart';
import 'package:ammu_portfolio/themes/typography.dart';
import 'package:ammu_portfolio/widgets/common/base_layout.dart';
import 'package:ammu_portfolio/widgets/common/page_skeletons.dart';
import 'package:ammu_portfolio/widgets/projects/project_listing.dart';

/// [ProjectScreen] is a placeholder screen for the projects section of the portfolio.
class ProjectScreen extends StatefulWidget {
  const ProjectScreen({super.key});

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 700), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return BaseLayout(
      currentIndex: 1,
      child: SingleChildScrollView(
        child:
            _isLoading
                ? const ProjectsPageSkeleton()
                : Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ProjectStrings.projectsLabel,
                        style: Theme.of(context).textTheme.headlineMedium600
                            ?.copyWith(color: AppColors.blackRock),
                      ),
                      SizedBox(height: 20),
                      Text(
                        ProjectStrings.helperText,
                        style: Theme.of(context).textTheme.labelLarge600
                            ?.copyWith(color: AppColors.blackRock),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal:
                              screenSize.width > 850
                                  ? screenSize.width * 0.1
                                  : 0,
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
