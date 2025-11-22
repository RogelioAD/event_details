import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:event_details/util/event_model.dart';

class DataTransform {
  Future<List<ElevationEvent>> loadEvents() async {
    try {
      final String jsonString = await rootBundle.loadString('assets/events.json');
      final List<dynamic> jsonList = jsonDecode(jsonString);

      return jsonList
          .map<ElevationEvent>((json) => ElevationEvent.fromJson(json))
          .toList();
    } catch (error) {
      print("Error loading events: $error");
      return [];
    }
  }
}
