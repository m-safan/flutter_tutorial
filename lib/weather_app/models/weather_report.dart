import 'package:flutter_totorial/weather_app/models/current.dart';
import 'package:flutter_totorial/weather_app/models/location.dart';

class WeatherReport {
  WeatherReport({required this.location, required this.current});

  factory WeatherReport.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'location': final Map<String, dynamic> location,
        'current': final Map<String, dynamic> current,
      } =>
        WeatherReport(
          location: Location.fromJson(location),
          current: Current.fromJson(current),
        ),
      _ => throw Exception('Could not deserialize WeatherReport model'),
    };
  }

  final Location location;
  final Current current;
}
