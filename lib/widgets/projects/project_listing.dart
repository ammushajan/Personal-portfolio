import 'package:flutter/material.dart';

import 'package:ammu_portfolio/themes/colors.dart';
import 'package:ammu_portfolio/themes/typography.dart';
import 'package:ammu_portfolio/core/services/project_services.dart';
import 'package:ammu_portfolio/core/models/project_details_model.dart';
import 'package:ammu_portfolio/widgets/common/page_skeletons.dart';

///[ProjectListing] is a widget that displays a list of projects.
class ProjectListing extends StatefulWidget {
  const ProjectListing({super.key});

  @override
  State<ProjectListing> createState() => _ProjectListingState();
}

class _ProjectListingState extends State<ProjectListing> {
  List<ProjectDetails> projects = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    ProjectServices()
        .loadProjectDetails()
        .then((data) {
          if (!mounted) {
            return;
          }
          setState(() {
            projects = data;
            _isLoading = false;
          });
        })
        .catchError((_) {
          if (!mounted) {
            return;
          }
          setState(() {
            _isLoading = false;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    if (_isLoading) {
      return const ProjectListSkeleton();
    }

    if (projects.isEmpty) {
      return Text(
        'No projects available right now.',
        style: Theme.of(
          context,
        ).textTheme.bodyLarge?.copyWith(color: AppColors.white),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        final project = projects[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 60.0),
          child: Flex(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: screenSize.width > 850 ? Axis.horizontal : Axis.vertical,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project.title,
                    style: Theme.of(context).textTheme.headlineExtraSmall600
                        ?.copyWith(color: AppColors.white),
                  ),
                  SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: AppColors.blackRock.withValues(alpha: 0.2),
                    ),
                    width:
                        screenSize.width > 850
                            ? screenSize.width * 0.4
                            : screenSize.width,
                    child: Text(
                      project.description,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyLarge?.copyWith(color: AppColors.white),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    project.framework,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(color: AppColors.white),
                  ),
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  project.image,
                  width: 400,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
