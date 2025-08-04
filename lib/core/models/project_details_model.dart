///[ProjectDetails] model class to represent project details.
/// It contains fields for title, description, image, and framework used.
class ProjectDetails {
  final String title;
  final String description;
  final String image;
  final String framework;

  ProjectDetails({
    required this.title,
    required this.description,
    required this.image,
    required this.framework,
  });

  factory ProjectDetails.fromJson(Map<String, dynamic> json) {
    return ProjectDetails(
      title: json['title'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      framework: json['framework'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'image': image,
      'framework': framework,
    };
  }
}
