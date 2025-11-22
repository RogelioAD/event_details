import 'package:event_details/components/event.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/event_model.dart';
import 'event_page.dart';

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
      //itemBuilder adds an index to each item
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EventPage(events[index])),
            );
          },
          child: Event(events[index]),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
