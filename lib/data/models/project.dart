class Project {
  const Project({
    required this.name,
    required this.tagline,
    required this.platformLabel,
    required this.description,
    required this.tech,
    this.highlights = const [],
  });

  final String name;
  final String tagline;
  final String platformLabel;
  final String description;
  final List<String> tech;
  final List<String> highlights;
}
