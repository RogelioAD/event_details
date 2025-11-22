
//model for organizing and calling JSON data
class ElevationEvent {
  final String id;
  final String title;
  final String location;
  final String startTime;
  final bool isFavorite;

  ElevationEvent({
    required this.id,
    required this.title,
    required this.location,
    required this.startTime,
    required this.isFavorite,
  });

  factory ElevationEvent.fromJson(Map<String, dynamic> json) {
    return ElevationEvent(
      id: json['id'] as String,
      title: json['title'] as String,
      location: json['location'] as String,
      startTime: json['startTime'] as String,
      isFavorite: json['isFavorite'] as bool,
    );
  }
}