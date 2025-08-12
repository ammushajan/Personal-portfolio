///[ProjectDetails] model class to represent project details.
/// It contains fields for title, description, image, and framework used.
class ProjectDetails {
  final String title;
  final String description;
  final String image;
  final List<String> frameworks;

  ProjectDetails({
    required this.title,
    required this.description,
    required this.image,
    required this.frameworks,
  });

  factory ProjectDetails.fromJson(Map<String, dynamic> json) => ProjectDetails(
    title: json["title"],
    description: json["description"],
    image: json["image"],
    frameworks: List<String>.from(json["frameworks"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "image": image,
    "frameworks": List<dynamic>.from(frameworks.map((x) => x)),
  };
}
