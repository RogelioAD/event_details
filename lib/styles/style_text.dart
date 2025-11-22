import 'package:flutter/material.dart';

class StyleText extends StatelessWidget {
  const StyleText(this.title, this.location, this.startTime, {super.key});

  final String title;
  final String location;
  final String startTime;

  @override
  Widget build(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title, style: TextStyle(color: Colors.white, fontSize: 28)),
        Text(location, style: TextStyle(color: Colors.white, fontSize: 20)),
        Text(startTime, style: TextStyle(color: Colors.white, fontSize: 20)),
      ],
    );
  }
}
