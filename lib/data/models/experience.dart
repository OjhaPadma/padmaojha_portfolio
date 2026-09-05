class Experience {
  const Experience({
    required this.role,
    required this.company,
    required this.location,
    required this.dates,
    required this.bullets,
  });

  final String role;
  final String company;
  final String location;
  final String dates;
  final List<String> bullets;
}
