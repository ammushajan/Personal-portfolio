import 'package:flutter/material.dart';

import 'package:personal_portfolio/themes/colors.dart';
import 'package:personal_portfolio/themes/typography.dart';
import 'package:personal_portfolio/core/services/project_services.dart';
import 'package:personal_portfolio/core/models/project_details_model.dart';

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
          padding: const EdgeInsets.only(bottom: 60.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
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
                      width: screenSize.width * 0.4,
                      child: Text(
                        project.description,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      project.framework,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
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
