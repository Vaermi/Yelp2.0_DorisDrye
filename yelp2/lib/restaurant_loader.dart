import 'package:shared_preferences/shared_preferences.dart';

abstract class RestaurantLoader {
  Future<List<String>?> load();

  void save(List<String> data);
}

class DummyRegionLoader implements RestaurantLoader {
  @override
  Future<List<String>?> load() {
    return Future.value(['Pizzahut', 'Amore Mio', 'Mexicano']);
  }

  @override
  void save(List<String> data) {}
}

class StorageRegionLoader implements RestaurantLoader {
  // ignore: constant_identifier_names
  static const RESTAURANT_KEY = 'RESTAURANTS';
  @override
  Future<List<String>?> load() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(RESTAURANT_KEY);
  }

  @override
  Future<void> save(List<String> data) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList(RESTAURANT_KEY, data);
  }
}
