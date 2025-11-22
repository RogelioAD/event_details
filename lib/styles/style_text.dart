import 'package:flutter/material.dart';
import 'package:event_details/util/date_formatter.dart';

class StyleText extends StatelessWidget {
  const StyleText(
    this.title,
    this.location,
    this.startTime, {
    this.category,
    this.description,
    super.key,
  });

  final String title;
  final String location;
  final String startTime;
  final String? category;
  final String? description;

  @override
  Widget build(context) {
    final List<Widget> children = [
      Text(title, style: TextStyle(color: Colors.white, fontSize: 28)),
      Text(location, style: TextStyle(color: Colors.white, fontSize: 20)),
      Text(
        DateFormatter.formatDateOnly(startTime),
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    ];

    if (category != null && category!.isNotEmpty) {
      children.add(
        Text(category!, style: TextStyle(color: Colors.white, fontSize: 18)),
      );
    }

    if (description != null && description!.isNotEmpty) {
      children.add(
        Text(description!, style: TextStyle(color: Colors.white, fontSize: 16)),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }
}
