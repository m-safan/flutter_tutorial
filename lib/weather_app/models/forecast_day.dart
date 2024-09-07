import 'package:flutter_totorial/weather_app/models/day.dart';
import 'package:flutter_totorial/weather_app/models/hour.dart';

class ForecastDay {
  ForecastDay({
    required this.date,
    required this.day,
    required this.hours,
  });

  final DateTime date;
  final Day day;
  final List<Hour> hours;

  factory ForecastDay.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'date': String date,
        'day': Map<String, dynamic> day,
        'hour': List<dynamic> hours,
      } =>
        ForecastDay(
          date: DateTime.parse(date),
          day: Day.fromJson(day),
          hours: hours.map((x) => Hour.fromJson(x)).toList(),
        ),
      _ =>
        throw const FormatException('Could not deserialize ForecastDay model'),
    };
  }
}
