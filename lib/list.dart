import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'style_text.dart';

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

//Widget is stateful because we would in theory add, remove, or edit event details
class EventListWidget extends StatefulWidget {
  const EventListWidget({super.key});
  @override
  State<EventListWidget> createState() {
    return _EventListWidgetState();
  }
}

class _EventListWidgetState extends State<EventListWidget> {
  List<ElevationEvent> events = [];
  bool isLoading = true;

  Future<void> loadEvents() async {
    try {
      final String jsonString = await rootBundle.loadString('assets/events.json');
      final List<dynamic> jsonList = jsonDecode(jsonString);

      setState(() {
        events = jsonList.map((json) => ElevationEvent.fromJson(json)).toList();
        isLoading = false;
      });
    } catch (error) {
      print('Error loading JSON: $error');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    loadEvents();
  }

  @override
  Widget build(BuildContext context) {
    //putting in some edgecases
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    if (events.isEmpty) {
      return Center(
        child: Text('Looks like there are no events yet. Stay tuned!'),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: events.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 100,
          color: const Color.fromARGB(255, 0, 0, 0),
          child: Center(   child: Center(child: StyleText(events[index].title, events[index].location, events[index].startTime)),),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
