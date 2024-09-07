import 'package:flutter_totorial/weather_app/models/condition.dart';

class Current {
  Current({required this.temperature, required this.condition});

  final double temperature;
  final Condition condition;

  factory Current.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'temp_c': double temperature,
        'condition': Map<String, dynamic> condition
      } =>
        Current(
            temperature: temperature, condition: Condition.fromJson(condition)),
      _ => throw Exception('Could not deserialize Current model'),
    };
  }
}
