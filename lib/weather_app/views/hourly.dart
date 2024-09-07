import 'package:flutter/material.dart';
import 'package:flutter_totorial/weather_app/models/weather_report.dart';
import 'package:intl/intl.dart';

class Hourly extends StatelessWidget {
  const Hourly({required this.weatherReport, super.key});

  final WeatherReport weatherReport;

  @override
  Widget build(BuildContext context) => Center(
        child: ListView.separated(
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) {
            final item = weatherReport.forecast.forecastday.first.hours[index];
            return Row(
              children: [
                Text(
                  DateFormat('hh:mm aa').format(item.time),
                  style: style,
                ),
                const Spacer(),
                SizedBox(
                  width: 110,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.network('http:${item.condition.icon}', height: 40),
                      Text(
                        item.rainPercentage > 0
                            ? '${item.rainPercentage}%'
                            : item.snowPercentage > 0
                                ? '${item.snowPercentage}%'
                                : '',
                        style: style,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Text(
                  '${item.temperature.round()} \u00b0C',
                  style: style,
                ),
              ],
            );
          },
          itemCount: weatherReport.forecast.forecastday.first.hours.length,
        ),
      );

  TextStyle get style => const TextStyle(fontSize: 24);
}
