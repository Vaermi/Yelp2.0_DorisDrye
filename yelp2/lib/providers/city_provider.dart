import 'package:yelp2/cities_loaders.dart';

class CityProvider {
  final CityLoader loader = StorageCityLoader();
  List<String> _cities = [];

  static final CityProvider _instance = CityProvider._internal();

  factory CityProvider() {
    return _instance;
  }

  CityProvider._internal();

  void add(String city) {
    _cities.add(city);
    loader.save(_cities);
  }

  List<String> get() {
    return _cities;
  }

  Future<List<String>> load() async {
    _cities = (await loader.load() ?? []);
    return get();
  }
}
