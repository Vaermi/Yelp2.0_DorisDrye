class Region {
  final String id;
  final String name;

  const Region(this.id, this.name);

  Region.fromJson(this.id, Map<String, dynamic> data)
      : name = data['name'] as String;
}
