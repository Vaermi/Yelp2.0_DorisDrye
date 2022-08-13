class Restaurant {
  final String name;
  final double rating;

  const Restaurant(this.name, this.rating);

  Restaurant.fromJson(Map<String, dynamic> data)
      : name = data['name'] as String,
        rating = data['rating'] as double;
}
