class Location {
  Location({required this.name, required this.region, required this.country});

  final String name;
  final String region;
  final String country;

  factory Location.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'name': String name,
        'region': String region,
        'country': String country,
      } =>
        Location(name: name, region: region, country: country),
      _ => throw Exception('Could not deserialize Location model'),
    };
  }
}
