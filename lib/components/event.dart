import 'package:event_details/components/favorite.dart';
import 'package:event_details/styles/style_text.dart';
import 'package:flutter/material.dart';
import 'package:event_details/util/event_model.dart';

class Event extends StatelessWidget {
  const Event(this.event, {this.onFavoriteChanged, super.key});

  //calling the whole event object
  final ElevationEvent event;
  final void Function(ElevationEvent updatedEvent)? onFavoriteChanged;

  @override
  Widget build(context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 100,
      color: Color.fromARGB(255, 37, 20, 2),
      child: Row(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: event.title.isNotEmpty && event.location.isNotEmpty && event.startTime.isNotEmpty
                  ? FittedBox(
                      fit: BoxFit.scaleDown,
                      child: StyleText(
                        title: event.title,
                        location: event.location,
                        startTime: event.startTime,
                      ),
                    )
                  : const Text(
                      "Missing full event information",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
            ),
          ),
          FavButton(event, onFavoriteChanged: onFavoriteChanged),
          Icon(
            Icons.navigate_next_sharp,
            color: const Color.fromARGB(255, 255, 255, 255),
            size: 40,
          ),
        ],
      ),
    );
  }
}
