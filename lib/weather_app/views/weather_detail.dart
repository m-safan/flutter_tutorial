import 'package:flutter/material.dart';
import 'package:flutter_totorial/weather_app/models/weather_report.dart';
import 'package:flutter_totorial/weather_app/views/daily.dart';
import 'package:flutter_totorial/weather_app/views/hourly.dart';

class WeatherDetail extends StatefulWidget {
  const WeatherDetail({required this.weatherReport, super.key});

  final WeatherReport weatherReport;

  @override
  State<WeatherDetail> createState() => _WeatherDetailState();
}

class _WeatherDetailState extends State<WeatherDetail>
    with TickerProviderStateMixin {
  late final _tabController = TabController(
    length: 2,
    vsync: this,
    animationDuration: const Duration(milliseconds: 500),
  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      widget.weatherReport.location.name,
                      style: const TextStyle(fontSize: 36),
                    ),
                    Text(
                        '${widget.weatherReport.location.region}, ${widget.weatherReport.location.country}')
                  ],
                ),
              ),
              Expanded(
                  child: Column(
                children: [
                  Image.network(
                      'http:${widget.weatherReport.current.condition.icon}')
                ],
              )),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      '${widget.weatherReport.current.temperature.round()}\u00b0C',
                      style: const TextStyle(fontSize: 42),
                    ),
                    Text(widget.weatherReport.current.condition.text)
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 50),
          const Divider(),
          TabBar.secondary(
            labelColor: Theme.of(context).colorScheme.onSurface,
            controller: _tabController,
            tabs: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Hourly', style: TextStyle(fontSize: 24)),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Daily', style: TextStyle(fontSize: 24)),
              ),
            ],
          ),
          Expanded(
              child: TabBarView(
            controller: _tabController,
            children: [
              Hourly(weatherReport: widget.weatherReport),
              Daily(weatherReport: widget.weatherReport),
            ],
          )),
        ],
      ),
    );
  }
}
