import 'package:event_details/styles/style_text.dart';
import 'package:flutter/material.dart';
import 'package:event_details/util/event_model.dart';

class EventPage extends StatefulWidget {
  const EventPage(this.event, {super.key});

  final ElevationEvent event;

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  late ElevationEvent currentEvent;

  @override
  void initState() {
    super.initState();
    currentEvent = widget.event;
  }

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StyleText(
                currentEvent.title,
                currentEvent.location,
                currentEvent.startTime,
                description: currentEvent.description,
                category: currentEvent.category,
              ),

              const SizedBox(height: 50),

              Text(
                currentEvent.isFavorite
                    ? "Added to your favorites"
                    : "Not added to your favorites",
                style: TextStyle(
                  color: currentEvent.isFavorite ? Colors.green : Colors.red,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
