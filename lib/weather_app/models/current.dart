import 'package:flutter_totorial/weather_app/models/condition.dart';

class Current {
  Current({required this.temperature, required this.condition});

  factory Current.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'temp_c': final double temperature,
        'condition': final Map<String, dynamic> condition,
      } =>
        Current(
          temperature: temperature,
          condition: Condition.fromJson(condition),
        ),
      _ => throw Exception('Could not deserialize Current model'),
    };
  }

  final double temperature;
  final Condition condition;
}
