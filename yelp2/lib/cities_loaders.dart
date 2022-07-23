import 'package:shared_preferences/shared_preferences.dart';

abstract class CityLoader {
  Future<List<String>?> load();

  void save(List<String> data);
}

class DummyCityLoader implements CityLoader {
  @override
  Future<List<String>?> load() {
    return Future.value(['Linz', 'Wien', 'Riga']);
  }

  @override
  void save(List<String> data) {}
}

class StorageCityLoader implements CityLoader {
  static const CITIES_KEY = 'CITIES';
  @override
  Future<List<String>?> load() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(CITIES_KEY);
  }

  @override
  Future<void> save(List<String> data) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList(CITIES_KEY, data);
  }
}
