import 'package:flutter/material.dart';
import 'package:flutter_totorial/weather_app/models/weather_report.dart';
import 'package:intl/intl.dart';

class Daily extends StatelessWidget {
  const Daily({required this.weatherReport, super.key});

  final WeatherReport weatherReport;

  @override
  Widget build(BuildContext context) => Center(
        child: ListView.separated(
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) {
            final item = weatherReport.forecast.forecastday[index];
            return Row(
              children: [
                Text(
                  DateFormat('dd-MM-yyyy').format(item.date),
                  style: style,
                ),
                const Spacer(),
                SizedBox(
                  width: 110,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.network('http:${item.day.condition.icon}',
                          height: 40),
                      Text(
                        item.day.rainPercentage > 0
                            ? '${item.day.rainPercentage}%'
                            : item.day.snowPercentage > 0
                                ? '${item.day.snowPercentage}%'
                                : '',
                        style: style,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Text(
                  '${item.day.minimumTemperature.round()} ~ ${item.day.maximumTemperature.round()}',
                  style: style,
                ),
              ],
            );
          },
          itemCount: weatherReport.forecast.forecastday.length,
        ),
      );

  TextStyle get style => const TextStyle(fontSize: 24);
}
