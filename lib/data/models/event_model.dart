class EventModel {
  final String id;
  final String title;
  final String bannerUrl;
  final String hAssets;
  final String location;
  final DateTime dateTime;
  final String category;
  final String description;
  final double price;
  final bool isFeatured;

  EventModel({
    required this.id,
    required this.title,
    required this.bannerUrl,
    required this.hAssets,
    required this.location,
    required this.dateTime,
    required this.category,
    required this.description,
    required this.price,
    this.isFeatured = false,
  });
}
