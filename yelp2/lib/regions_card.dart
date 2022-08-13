import 'package:flutter/material.dart';
import 'package:yelp2/own_card.dart';
import 'package:yelp2/region.dart';
import 'package:yelp2/region_restaurant_screen.dart';

class RegionsCard extends StatelessWidget {
  final Region region;
  // RegionsCard(String city) {
  //   this.city = city;
  // }
  const RegionsCard(this.region, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OwnCard(
      child: Center(child: Text(region.name)),
      onTap: () => Navigator.pushNamed(context, '/region_restaurants',
          arguments: RegionRestaurantsScreenArgs(region: region)),
    );
  }
}
