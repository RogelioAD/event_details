import 'package:event_details/components/event.dart';
import 'package:flutter/material.dart';
import 'package:event_details/util/event_model.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'event_page.dart';

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

  @override
  void initState() {
    super.initState();
    loadEvents();
  }

  Future<void> loadEvents() async {
    try {
      final String jsonString = await rootBundle.loadString(
        'assets/events.json',
      );
      final List<dynamic> jsonList = jsonDecode(jsonString);

      setState(() {
        events = jsonList.map((json) => ElevationEvent.fromJson(json)).toList();
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //putting in some edgecases
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    if (events.isEmpty) {
      return Center(
          child: Text(
            'Looks like there are no events yet. Stay tuned!',
            style: const TextStyle(
              color: Color.fromARGB(255, 214, 233, 255),
              fontSize: 18,
            ),
          ),
        );
    }

    return Container(
      color: Color.fromARGB(255, 37, 20, 2),
      child: ListView.separated(
        padding: const EdgeInsets.all(0),
        itemCount: events.length,
        //itemBuilder adds an index to each item
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EventPage(events[index]),
                ),
              );
            },
            child: Event(
              events[index],
              onFavoriteChanged: (updatedEvent) {
                setState(() {
                  events[index] = updatedEvent;
                });
              },
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(
          color: Color.fromARGB(255, 214, 233, 255),
          thickness: 1.0,
        ),
      ),
    );
  }
}
