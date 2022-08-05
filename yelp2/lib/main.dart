import 'package:flutter/material.dart';
import 'package:yelp2/add_region_screen.dart';
import 'package:yelp2/fade_route.dart';
import 'package:yelp2/providers/restaurant_provider.dart';
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
        initialRoute: '/home',
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/home':
              return FadeRoute(const RegionsScreen());
            case '/add_region':
              return FadeRoute(AddRegionScreen());
            case '/add_restaurant':
              return FadeRoute(RestaurantProvider());
            default:
              return FadeRoute(const RegionsScreen());
          }
        },
        darkTheme: ThemeData(
          primaryColor: Colors.green,
        ),
        home: const RegionsScreen());
  }
}
