//model for organizing and calling JSON data
class ElevationEvent {
  final String id;
  final String title;
  final String location;
  final String startTime;
  final String category;
  final String description;
  final bool isFavorite;

  ElevationEvent({
    required this.id,
    required this.title,
    required this.location,
    required this.startTime,
    required this.category,
    required this.description,
    required this.isFavorite,
  });

  factory ElevationEvent.fromJson(Map<String, dynamic> json) {
    return ElevationEvent(
      id: json['id'] as String,
      title: json['title'] as String,
      location: json['location'] as String,
      startTime: json['startTime'] as String,
      category: json['category'] as String,
      description: json['description'] as String,
      isFavorite: json['isFavorite'] as bool,
    );
  }

  //created a copy of the data so the original JSON doesn't get affected
  ElevationEvent copyWith({
    String? id,
    String? title,
    String? location,
    String? startTime,
    String? category,
    String? description,
    bool? isFavorite,
  }) {
    return ElevationEvent(
      id: id ?? this.id,
      title: title ?? this.title,
      location: location ?? this.location,
      startTime: startTime ?? this.startTime,
      category: category ?? this.category,
      description: description ?? this.description,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
