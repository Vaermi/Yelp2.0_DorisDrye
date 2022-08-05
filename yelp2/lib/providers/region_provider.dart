import 'package:yelp2/region_loader.dart';

class RegionProvider {
  final RegionLoader loader = StorageRegionLoader();
  List<String> _regions = [];

  // private static CityProvider instance;
  static final RegionProvider _instance = RegionProvider._internal();

  // public static CityProvider getInstance(){
  //  if(instance == null){
  //   instance = new CityProvider();
  //  }
  //  return instance;
  // }
  factory RegionProvider() {
    return _instance;
  }

  //private CityProvider(){}
  RegionProvider._internal();

  void add(String region) {
    _regions.add(region);
    loader.save(_regions);
  }

  List<String> get() {
    return _regions;
  }

  Future<List<String>> load() async {
    _regions = (await loader.load()) ?? [];
    return get();
  }
}
