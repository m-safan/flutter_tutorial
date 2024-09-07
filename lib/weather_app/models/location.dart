class Location {
  Location({required this.name, required this.region, required this.country});

  factory Location.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'name': final String name,
        'region': final String region,
        'country': final String country,
      } =>
        Location(name: name, region: region, country: country),
      _ => throw Exception('Could not deserialize Location model'),
    };
  }
  final String name;
  final String region;
  final String country;
}
