import 'package:flutter/material.dart';
import 'package:event_details/util/date_formatter.dart';

class StyleText extends StatelessWidget {
  const StyleText({
    this.title,
    this.location,
    this.startTime,
    this.category,
    this.description,
    super.key,
  });

  final String? title;
  final String? location;
  final String? startTime;
  final String? category;
  final String? description;

  @override
  Widget build(context) {
    final List<Widget> children = [
      if (title != null)
        Text(
          title!,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: const Color.fromARGB(255, 214, 233, 255),
            fontSize: 17,
          ),
        ),
      if (location != null)
        Text(
          location!,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: const Color.fromARGB(255, 214, 233, 255),
            fontSize: 13,
          ),
        ),

      if (startTime != null)
        Text(
          DateFormatter.formatDateOnly(startTime!),
          textAlign: TextAlign.left,
          style: TextStyle(
            color: const Color.fromARGB(255, 214, 233, 255),
            fontSize: 13,
          ),
        ),

      if (category != null)
        Text(
          category!,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: const Color.fromARGB(255, 214, 233, 255),
            fontSize: 13,
          ),
        ),
      if (description != null)
        Text(
          description!,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: const Color.fromARGB(255, 214, 233, 255),
            fontSize: 13,
          ),
        ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }
}
