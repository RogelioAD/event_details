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
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 26, 15, 3),
        leading: IconButton(
          onPressed: () => Navigator.of(context).maybePop(),
          icon: const Icon(color: Colors.white, Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StyleText(
                title: currentEvent.title,
                location: currentEvent.location,
                category: currentEvent.category,
              ),

              const SizedBox(height: 20),

              if (currentEvent.description.isNotEmpty)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(83, 98, 130, 167),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    currentEvent.description,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 214, 233, 255),
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                )
              else
                const Text(
                  "No information available",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StyleText(startTime: currentEvent.startTime),

                  Text(
                    currentEvent.isFavorite ? "Favorited" : "Not Favorited",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: currentEvent.isFavorite
                          ? Colors.orange
                          : const Color.fromARGB(162, 248, 237, 235),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
