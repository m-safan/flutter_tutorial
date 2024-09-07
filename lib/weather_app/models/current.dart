import 'package:flutter_totorial/weather_app/models/conditon.dart';

class Current {
  Current({required this.temperature, required this.conditon});

  final double temperature;
  final Conditon conditon;

  factory Current.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'temp_c': double temperature,
        'condition': Map<String, dynamic> condition
      } =>
        Current(
            temperature: temperature, conditon: Conditon.fromJson(condition)),
      _ => throw Exception('Could not deserialize Current model'),
    };
  }
}
