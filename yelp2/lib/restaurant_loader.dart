import 'package:shared_preferences/shared_preferences.dart';
import 'package:yelp2/restaurant.dart';

abstract class RestaurantLoader {
  Future<List<Restaurant>?> load();

  void save(List<Restaurant> data);
}

class DummyRestaurantLoader implements RestaurantLoader {
  @override
  Future<List<Restaurant>?> load() {
    return Future.value(const [
      Restaurant('muto Restaurant', 2.5),
      Restaurant('Amore Mio', 3.5),
      Restaurant('Mexicano', 4.0)
    ]);
  }

  @override
  void save(List<Restaurant> data) {}
}
