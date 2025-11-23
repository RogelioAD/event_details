import 'package:event_details/components/list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: false, // Disable defaultt styleing
        scaffoldBackgroundColor: const Color.fromARGB(255, 26, 15, 3),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 26, 15, 3),
        appBar: AppBar(
          title: Text('Elevation Events'),
          backgroundColor: const Color.fromARGB(255, 26, 15, 3),
          elevation: 0,
          surfaceTintColor: const Color.fromARGB(255, 78, 45, 9),
          shadowColor: const Color.fromARGB(255, 0, 0, 0),
        ),
        body: EventListWidget(),
      ),
    );
  }
}
