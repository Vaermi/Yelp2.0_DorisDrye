import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yelp2/region.dart';

abstract class RegionLoader {
  Future<List<Region>?> load();

  void save(List<Region> data);
}

// class DummyRegionLoader implements RegionLoader {
//   @override
//   Future<List<Region>?> load() {
//     return Future.value(['Linz', 'Wien', 'Riga']);
//   }

//   @override
//   void save(List<Region> data) {}
// }

// class StorageRegionLoader implements RegionLoader {
//   // ignore: constant_identifier_names
//   static const REGIONS_KEY = 'REGIONS';
//   @override
//   Future<List<Region>?> load() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getStringList(REGIONS_KEY);
//   }

//   @override
//   Future<void> save(List<Region> data) async {
//     final prefs = await SharedPreferences.getInstance();
//     prefs.setStringList(REGIONS_KEY, data);
//   }
// }

class DatabaseRegionLoader implements RegionLoader {
  @override
  Future<List<Region>?> load() async {
    final db = FirebaseFirestore.instance;
    final snapshot = await db.collection("regions").get();
    return snapshot.docs
        .map((doc) => Region.fromJson(doc.id, doc.data()))
        .toList();
  }

  @override
  void save(List<Region> data) {
    // TODO: implement save
  }
}
