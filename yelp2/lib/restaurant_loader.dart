import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yelp2/restaurant.dart';

abstract class RestaurantLoader {
  Future<List<Restaurant>?> load(String regionId);

  void save(List<Restaurant> data);
}

class DummyRestaurantLoader implements RestaurantLoader {
  @override
  Future<List<Restaurant>?> load(String regionId) {
    return Future.value(const [
      Restaurant('muto Restaurant', 2.5),
      Restaurant('Amore Mio', 3.5),
      Restaurant('Mexicano', 4.0)
    ]);
  }

  @override
  void save(List<Restaurant> data) {}
}

class DatabaseRestaurantLoader implements RestaurantLoader {
  @override
  Future<List<Restaurant>?> load(String regionId) async {
    final db = FirebaseFirestore.instance;
    final snapshot = await db.collection("regions/$regionId/restaurants").get();
    return snapshot.docs.map((doc) => Restaurant.fromJson(doc.data())).toList();
  }

  @override
  void save(List<Restaurant> data) {
    // TODO: implement save
  }
}
