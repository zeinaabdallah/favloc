class Location {
  final int id;
  final String name;
  final String theme;
  final String description;
  final String imageUrl;
  final String locationUrl;

  Location(
      {required this.id,
      required this.name,
      required this.description,
      required this.theme,
      required this.imageUrl,
      required this.locationUrl});
}
