class Location {
  final int id;
  final String name;
  final String theme;
  late String description;
  final String imageUrl;
  late String locationUrl;

  Location(
      {required this.id,
      required this.name,
      String? description,
      required this.theme,
      required this.imageUrl,
      String? locationUrl});
}
