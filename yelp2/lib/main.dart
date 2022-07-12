import 'package:flutter/material.dart';
import 'package:yelp2/regions_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        darkTheme: ThemeData(
          primaryColor: Colors.green,
        ),
        home: const RegionsScreen());
  }
}
