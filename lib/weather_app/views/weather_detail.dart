import 'package:flutter/material.dart';
import 'package:flutter_totorial/weather_app/models/weather_report.dart';

class WeatherDetail extends StatelessWidget {
  const WeatherDetail({required this.weatherReport, super.key});

  final WeatherReport weatherReport;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            children: [
              Text(
                weatherReport.location.name,
                style: const TextStyle(fontSize: 36),
              ),
              Text(
                  '${weatherReport.location.region}, ${weatherReport.location.country}')
            ],
          ),
        ),
        Expanded(
            child: Column(
          children: [
            Image.network('http:${weatherReport.current.condition.icon}'),
          ],
        )),
        Expanded(
          child: Column(
            children: [
              Text(
                '${weatherReport.current.temperature.round()}\u00b0C',
                style: const TextStyle(fontSize: 42),
              ),
              Text(weatherReport.current.condition.text)
            ],
          ),
        )
      ],
    );
  }
}
