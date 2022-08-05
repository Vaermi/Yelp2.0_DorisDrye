import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class RestaurantCard extends StatelessWidget {
  final String restaurant;
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
      child: Text(restaurant),
    );
  }
}
