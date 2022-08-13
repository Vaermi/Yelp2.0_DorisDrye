import 'package:flutter/material.dart';
import 'package:yelp2/restaurant.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantCard(this.restaurant, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 40),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  blurRadius: 10,
                  color: Color.fromARGB(16, 0, 0, 0),
                  offset: Offset(0, 4))
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(restaurant.name),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(restaurant.rating.toString()),
                const Icon(Icons.star_border)
              ],
            )
          ],
        ));
  }
}
