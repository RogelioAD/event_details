import 'package:event_details/components/favorite.dart';
import 'package:event_details/styles/style_text.dart';
import 'package:flutter/material.dart';
import '../models/event_model.dart';

class Event extends StatelessWidget {
  const Event(this.event, {super.key});

  //calling the whole event object
  final ElevationEvent event;

  @override
  Widget build(context) {
    return Container(
      height: 100,
      color: const Color.fromARGB(255, 0, 0, 0),
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: StyleText(event.title, event.location, event.startTime),
              ),
            ),
          ),
          FavButton(event.isFavorite, event),
        ],
      ),
    );
  }
}
