import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  dynamic jsonData;
  Future<void> loadJsonAsset() async {
    final String jsonString = await rootBundle.loadString('assets/data.json');
    var data = jsonDecode(jsonString);
    setState(() {
      jsonData = data;
    });
    //print(jsonData);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadJsonAsset();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(title: Text('Load Assets Json')),
        body: Center(
          child: jsonData != null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(jsonData[1]['title']),
                    Text(jsonData[1]['location']),
                    Text(jsonData[1]['startTime']),
                    Text(jsonData[1]['category']),
                    Text(jsonData[1]['description']),
                    CheckboxListTile(value: jsonData[1]['isFavorite'], onChanged: (value) {
                      setState(() {
                        jsonData[1]['isFavorite'] = value;
                      });
                    }),
                  ],
                )
              : CircularProgressIndicator(),
        ),
      ),
    );
  }
}
