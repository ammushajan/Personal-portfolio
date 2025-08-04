import 'dart:convert';
import 'package:flutter/services.dart';

import 'package:personal_portfolio/core/models/project_details_model.dart';

/// [ProjectServices] class to handle project-related operations such as loading project details.
class ProjectServices {
  ///[loadProjectDetails] method to load project details from a JSON file.
  Future<List<ProjectDetails>> loadProjectDetails() async {
    final String jsonString = await rootBundle.loadString(
      'assets/mocks/project_details.json',
    );
    List<dynamic> jsonData = jsonDecode(jsonString);
    List<ProjectDetails> projects = [];
    for (var project in jsonData) {
      projects.add(ProjectDetails.fromJson(project));
    }
    return projects;
  }
}
