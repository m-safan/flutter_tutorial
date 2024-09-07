import 'package:flutter_totorial/weather_app/models/condition.dart';

class Hour {
  Hour({
    required this.time,
    required this.temperature,
    required this.condition,
    required this.rainPercentage,
    required this.snowPercentage,
  });

  factory Hour.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'time': final String time,
        'temp_c': final double temperature,
        'condition': final Map<String, dynamic> condition,
        'chance_of_rain': final int rainPercentage,
        'chance_of_snow': final int snowPercentage,
      } =>
        Hour(
          time: DateTime.parse(time),
          temperature: temperature,
          condition: Condition.fromJson(condition),
          rainPercentage: rainPercentage,
          snowPercentage: snowPercentage,
        ),
      _ => throw const FormatException('Could not deserialize Hour model'),
    };
  }

  final DateTime time;
  final double temperature;
  final Condition condition;
  final int rainPercentage;
  final int snowPercentage;
}
