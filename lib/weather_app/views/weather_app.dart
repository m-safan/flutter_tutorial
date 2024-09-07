import 'package:flutter/material.dart';
import 'package:flutter_totorial/weather_app/controllers/weather_app_controller.dart';
import 'package:flutter_totorial/weather_app/models/location.dart';
import 'package:flutter_totorial/weather_app/models/weather_report.dart';
import 'package:flutter_totorial/weather_app/views/weather_detail.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  final _textController = TextEditingController();
  final _controller = WeatherAppController();
  WeatherReport? _weatherReport;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TypeAheadField<Location>(
              controller: _textController,
              itemBuilder: (context, value) => ListTile(
                title: Text(value.name),
                subtitle: Text('${value.region}, ${value.country}'),
              ),
              onSelected: (value) async {
                try {
                  _textController.text = value.name;
                  final weatherReport =
                      await _controller.getWeatherReport(value.name);
                  setState(() {
                    _weatherReport = weatherReport;
                  });
                } on Exception {
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    backgroundColor: Colors.red,
                    showCloseIcon: true,
                    duration: Duration(seconds: 5),
                    content: Text('Oops, Something went wrong'),
                  ));
                }
              },
              suggestionsCallback: (search) async {
                try {
                  return await _controller.getLocations(search);
                } on Exception {
                  return [];
                }
              },
              builder: (context, controller, focusNode) => TextFormField(
                controller: controller,
                focusNode: focusNode,
                decoration: InputDecoration(
                    hintText: 'Search City',
                    suffixIcon: controller.text.isEmpty
                        ? null
                        : IconButton(
                            onPressed: () {
                              controller.clear();
                              setState(() {
                                _weatherReport = null;
                              });
                            },
                            icon: const Icon(Icons.close))),
              ),
            ),
            if (_weatherReport != null) ...[
              const SizedBox(height: 50),
              WeatherDetail(weatherReport: _weatherReport!),
            ]
          ],
        ),
      ),
    );
  }
}
