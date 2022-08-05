import 'package:flutter/material.dart';
import 'package:yelp2/providers/restaurant_provider.dart';
import 'package:yelp2/restaurant_card.dart';

class RegionRestaurantScreen extends StatefulWidget {
  const RegionRestaurantScreen({Key? key}) : super(key: key);

  @override
  State<RegionRestaurantScreen> createState() => _RegionRestaurantScreen();
}

class _RegionRestaurantScreen extends State<RegionRestaurantScreen> {
  List<String> restaurants = [];

  @override
  void initState() {
    super.initState();
    RestaurantProvider()
        .load()
        .then((value) => setState(() => restaurants = value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yelp 2.0'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: IconButton(
        icon: const Icon(Icons.add_outlined),
        onPressed: _addRegion,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: restaurants.map((String c) => RestaurantCard(c)).toList(),
        ),
      ),
    );
  }

  void _addRegion() async {
    await Navigator.pushNamed(context, '/add_restaurant');
    setState(() {
      restaurants = RestaurantProvider().get();
    });
  }
}
