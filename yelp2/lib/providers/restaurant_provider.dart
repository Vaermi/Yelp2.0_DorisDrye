import 'package:yelp2/region_loader.dart';

class RestaurantProvider {
  final RestaurantLoader loader = StorageRegionLoader() as RestaurantLoader;
  List<String> _restaurants = [];

  static final RestaurantProvider _instance = RestaurantProvider._internal();

  factory RestaurantProvider() {
    return _instance;
  }

  RestaurantProvider._internal();

  void add(String restaurants) {
    _restaurants.add(restaurants);
    loader.save(_restaurants);
  }

  List<String> get() {
    return _restaurants;
  }

  Future<List<String>> load() async {
    _restaurants = (await loader.load()) ?? [];
    return get();
  }
}
