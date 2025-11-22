import 'package:event_details/components/favorite.dart';
import 'package:event_details/styles/style_text.dart';
import 'package:flutter/material.dart';
import '../models/event_model.dart';

class EventPage extends StatelessWidget {
  const EventPage(this.event, {super.key});

  //calling the whole event object
  final ElevationEvent event;

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
              StyleText(event.title, event.location, event.startTime),
              const SizedBox(height: 20),
              FavButton(event.isFavorite, event),
            ],
          ),
        ),
      ),
    );
  }
}
