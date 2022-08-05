import 'package:shared_preferences/shared_preferences.dart';

abstract class RegionLoader {
  Future<List<String>?> load();

  void save(List<String> data);
}

class DummyRegionLoader implements RegionLoader {
  @override
  Future<List<String>?> load() {
    return Future.value(['Linz', 'Wien', 'Riga']);
  }

  @override
  void save(List<String> data) {}
}

class StorageRegionLoader implements RegionLoader {
  // ignore: constant_identifier_names
  static const REGIONS_KEY = 'REGIONS';
  @override
  Future<List<String>?> load() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(REGIONS_KEY);
  }

  @override
  Future<void> save(List<String> data) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList(REGIONS_KEY, data);
  }
}
