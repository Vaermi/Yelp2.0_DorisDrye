import 'package:flutter/material.dart';
import 'package:yelp2/add_restaurant_screen.dart';
import 'package:yelp2/providers/restaurant_provider.dart';
import 'package:yelp2/region.dart';
import 'package:yelp2/restaurant.dart';
import 'package:yelp2/restaurant_card.dart';
import 'package:yelp2/screen.dart';

class RegionRestaurantsScreenArgs {
  final Region region;

  const RegionRestaurantsScreenArgs({required this.region});
}

class RegionRestaurantsScreen extends StatefulWidget {
  final RegionRestaurantsScreenArgs args;
  const RegionRestaurantsScreen(this.args, {Key? key}) : super(key: key);

  @override
  State<RegionRestaurantsScreen> createState() =>
      _RegionRestaurantsScreenState();
}

class _RegionRestaurantsScreenState extends State<RegionRestaurantsScreen> {
  List<Restaurant> restaurants = [];

  @override
  void initState() {
    super.initState();
    RestaurantProvider()
        .load(widget.args.region.id)
        .then((value) => setState(() => restaurants = value));
  }

  @override
  Widget build(BuildContext context) {
    return Screen(
      onFabPressed: _addRestaurant,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(widget.args.region.name),
          Column(
            children:
                restaurants.map((Restaurant r) => RestaurantCard(r)).toList(),
          )
        ],
      ),
    );
  }

  void _addRestaurant() async {
    await Navigator.pushNamed(context, '/add_restaurant',
        arguments: AddRestaurantScreenArgs(widget.args.region.id));
    // setState(() {
    //   regions = RegionProvider().get();
    // });
  }
}
