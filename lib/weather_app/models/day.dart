import 'package:flutter_totorial/weather_app/models/condition.dart';

class Day {
  Day({
    required this.maximumTemperature,
    required this.minimumTemperature,
    required this.averageTemperature,
    required this.rainPercentage,
    required this.snowPercentage,
    required this.condition,
  });

  final double maximumTemperature;
  final double minimumTemperature;
  final double averageTemperature;
  final int rainPercentage;
  final int snowPercentage;
  final Condition condition;

  factory Day.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'maxtemp_c': double maximumTemperature,
        'mintemp_c': double minimumTemperature,
        'avgtemp_c': double averageTemperature,
        'daily_chance_of_rain': int rainPercentage,
        'daily_chance_of_snow': int snowPercentage,
        'condition': Map<String, dynamic> condition,
      } =>
        Day(
          maximumTemperature: maximumTemperature,
          minimumTemperature: minimumTemperature,
          averageTemperature: averageTemperature,
          rainPercentage: rainPercentage,
          snowPercentage: snowPercentage,
          condition: Condition.fromJson(condition),
        ),
      _ => throw const FormatException('Could not deserialize Day model'),
    };
  }
}
