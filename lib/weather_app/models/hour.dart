import 'package:flutter_totorial/weather_app/models/condition.dart';

class Hour {
  Hour({
    required this.time,
    required this.temperature,
    required this.condition,
    required this.rainPercentage,
    required this.snowPercentage,
  });

  final DateTime time;
  final double temperature;
  final Condition condition;
  final int rainPercentage;
  final int snowPercentage;

  factory Hour.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'time': String time,
        'temp_c': double temperature,
        'condition': Map<String, dynamic> condition,
        'chance_of_rain': int rainPercentage,
        'chance_of_snow': int snowPercentage,
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
}
