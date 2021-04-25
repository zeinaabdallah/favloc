class Location {
  final int id;
  final String name;
  late String theme;
  late String description;
  late String imageUrl;
  late String locationUrl;

  Location(
      {required this.id,
      required this.name,
      String? description,
      String? theme,
      required String imageUrl,
      String? locationUrl});
}
