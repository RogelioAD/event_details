// EXAMPLE CODE - Shows how to adapt your list.dart to use JSON
// This file is for reference only, your original list.dart is unchanged

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

// Step 1: Create a class to represent each event from JSON
class Event {
  final String id;
  final String title;
  final String location;
  final String startTime;
  final String category;
  final String description;
  final bool isFavorite;

  Event({
    required this.id,
    required this.title,
    required this.location,
    required this.startTime,
    required this.category,
    required this.description,
    required this.isFavorite,
  });

  // Factory constructor to create Event from JSON
  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'] as String,
      title: json['title'] as String,
      location: json['location'] as String,
      startTime: json['startTime'] as String,
      category: json['category'] as String,
      description: json['description'] as String,
      isFavorite: json['isFavorite'] as bool,
    );
  }
}

// Step 2: Create a StatefulWidget to handle async JSON loading
class EventListWidget extends StatefulWidget {
  @override
  _EventListWidgetState createState() => _EventListWidgetState();
}

class _EventListWidgetState extends State<EventListWidget> {
  List<Event> events = []; // This replaces your hardcoded 'entries' list
  bool isLoading = true;

  // Step 3: Load and parse JSON file (similar to your main.dart)
  Future<void> loadEvents() async {
    try {
      final String jsonString = await rootBundle.loadString('assets/data.json');
      final List<dynamic> jsonList = jsonDecode(jsonString);
      
      // Step 4: Convert each JSON object to an Event object
      setState(() {
        events = jsonList.map((json) => Event.fromJson(json)).toList();
        isLoading = false;
      });
    } catch (e) {
      print('Error loading JSON: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    loadEvents(); // Load JSON when widget initializes
  }

  // Step 5: Map color codes by category (optional - replaces hardcoded colorCodes)
  Color? getColorByCategory(String category) {
    Map<String, int> categoryColors = {
      'Worship': 600,
      'Outreach': 500,
      'Community': 400,
      'Youth': 300,
    };
    int? shade = categoryColors[category] ?? 100;
    return Colors.amber[shade];
  }

  // Step 6: Build ListView using parsed events (adapted from your original build method)
  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    if (events.isEmpty) {
      return Center(child: Text('No events found'));
    }

    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: events.length, // Use events.length instead of entries.length
      itemBuilder: (BuildContext context, int index) {
        Event event = events[index]; // Get event at current index
        
        return Container(
          height: 50,
          color: getColorByCategory(event.category), // Use category-based color
          child: Center(
            child: Text(
              event.title, // Display event title instead of 'Entry ${entries[index]}'
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}

/* 
KEY DIFFERENCES FROM YOUR ORIGINAL CODE:

1. CONSTANT LISTS → DYNAMIC DATA:
   OLD: const List<String> entries = <String>['A', 'B', 'C'];
   NEW: List<Event> events = []; // Loaded from JSON

2. STATIC BUILD → STATEFUL WIDGET:
   OLD: Widget build(BuildContext context) { ... }
   NEW: StatefulWidget with initState() to load JSON asynchronously

3. HARDCODED VALUES → JSON PROPERTIES:
   OLD: Text('Entry ${entries[index]}')
   NEW: Text(event.title) // or event.location, event.category, etc.

4. FIXED COLORS → DYNAMIC COLORS:
   OLD: Colors.amber[colorCodes[index]]
   NEW: getColorByCategory(event.category) // Based on event data

5. SYNCHRONOUS → ASYNCHRONOUS:
   - JSON loading is async, so you need Future and await
   - Show loading indicator while data loads
   - Update UI with setState() after loading completes

HOW TO INTEGRATE THIS INTO YOUR list.dart:

1. Add imports: dart:convert and flutter/services.dart
2. Create Event class (or use Map directly if you prefer)
3. Convert your Widget build() to a StatefulWidget
4. Add loadEvents() method to load JSON
5. Call loadEvents() in initState()
6. Update ListView to use events list instead of entries
7. Access event properties: event.title, event.location, etc.
*/

