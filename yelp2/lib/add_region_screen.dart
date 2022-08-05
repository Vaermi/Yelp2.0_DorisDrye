import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:yelp2/providers/region_provider.dart';

class AddRegionScreen extends StatelessWidget {
  final TextEditingController cityController = TextEditingController();
  AddRegionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        TextField(
          controller: cityController,
          maxLines: 1,
          decoration: InputDecoration(hintText: 'Cityname'),
        ),
        InkWell(
          onTap: () {
            final input = cityController.value.text;
            RegionProvider().add(input);
            Navigator.pop(context);
          },
          child: Container(
            color: Colors.green,
            child: const Text('Add Region'),
          ),
        )
      ]),
    );
  }
}
