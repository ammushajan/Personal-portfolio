import 'package:flutter/material.dart';

import 'package:ammu_portfolio/themes/colors.dart';
import 'package:ammu_portfolio/themes/typography.dart';
import 'package:ammu_portfolio/core/services/project_services.dart';
import 'package:ammu_portfolio/core/models/project_details_model.dart';

///[ProjectListing] is a widget that displays a list of projects.
class ProjectListing extends StatefulWidget {
  const ProjectListing({super.key});

  @override
  State<ProjectListing> createState() => _ProjectListingState();
}

class _ProjectListingState extends State<ProjectListing> {
  List<ProjectDetails> projects = [];
  @override
  void initState() {
    super.initState();
    ProjectServices().loadProjectDetails().then((data) {
      setState(() {
        projects = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return ListView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        final project = projects[index];
        return Padding(
          padding: EdgeInsets.only(bottom: screenSize.width * 0.05),
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
                  SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(12.0),
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
                  SizedBox(height: 12),
                  Row(
                    children: [
                      ...project.frameworks.map(
                        (element) => Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Chip(
                            side: BorderSide(
                              color: AppColors.blackRock.withValues(alpha: 0.2),
                            ),
                            label: Text(
                              element,
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(color: AppColors.white),
                            ),
                            backgroundColor: AppColors.purplePizzazz.withValues(
                              alpha: 0.2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
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
