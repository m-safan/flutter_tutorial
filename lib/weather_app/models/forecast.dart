import 'package:flutter_totorial/weather_app/models/forecast_day.dart';

class Forecast {
  Forecast({
    required this.forecastday,
  });

  final List<ForecastDay> forecastday;

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'forecastday': List<dynamic> forecastday,
      } =>
        Forecast(
          forecastday: forecastday
              .map((x) => ForecastDay.fromJson(x as Map<String, dynamic>))
              .toList(),
        ),
      _ => throw const FormatException('Could not deserialize Forecast model'),
    };
  }
}
