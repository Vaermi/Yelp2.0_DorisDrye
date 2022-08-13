import 'package:yelp2/restaurant.dart';
import 'package:yelp2/restaurant_loader.dart';

class RestaurantProvider {
  final RestaurantLoader loader = DatabaseRestaurantLoader();
  List<Restaurant> _restaurants = [];

  static final RestaurantProvider _instance = RestaurantProvider._internal();

  factory RestaurantProvider() {
    return _instance;
  }

  RestaurantProvider._internal();

  void add(Restaurant restaurants) {
    _restaurants.add(restaurants);
    loader.save(_restaurants);
  }

  List<Restaurant> get() {
    return _restaurants;
  }

  Future<List<Restaurant>> load(String regionId) async {
    _restaurants = (await loader.load(regionId)) ?? [];
    return get();
  }
}
