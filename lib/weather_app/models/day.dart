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

  factory Day.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'maxtemp_c': final double maximumTemperature,
        'mintemp_c': final double minimumTemperature,
        'avgtemp_c': final double averageTemperature,
        'daily_chance_of_rain': final int rainPercentage,
        'daily_chance_of_snow': final int snowPercentage,
        'condition': final Map<String, dynamic> condition,
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

  final double maximumTemperature;
  final double minimumTemperature;
  final double averageTemperature;
  final int rainPercentage;
  final int snowPercentage;
  final Condition condition;
}
