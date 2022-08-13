import 'package:flutter/material.dart';
import 'package:yelp2/providers/region_provider.dart';
import 'package:yelp2/region.dart';
import 'package:yelp2/regions_card.dart';
import 'package:yelp2/screen.dart';

class RegionsScreen extends StatefulWidget {
  const RegionsScreen({Key? key}) : super(key: key);

  @override
  State<RegionsScreen> createState() => _RegionsScreenState();
}

class _RegionsScreenState extends State<RegionsScreen> {
  List<Region> cities = [];

  @override
  void initState() {
    super.initState();
    RegionProvider().load().then((value) => setState(() => cities = value));
  }

  @override
  Widget build(BuildContext context) {
    return Screen(
      onFabPressed: _addRegion,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: cities.map((Region c) => RegionsCard(c)).toList(),
      ),
    );
  }

  void _addRegion() async {
    await Navigator.pushNamed(context, '/add_region');
    setState(() {
      cities = RegionProvider().get();
    });
  }
}
