class Location {
  final int id;
  final String name;
  final String theme;
  final String description;
  final String imageUrl;
  late String locationUrl;

  Location(
      {required this.id,
      required this.name,
      required this.description,
      required this.theme,
      required this.imageUrl,
      String? locationUrl});
}
