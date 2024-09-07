import 'package:flutter/material.dart';
import 'package:flutter_totorial/counter_app/counter_app.dart';
import 'package:flutter_totorial/weather_app/views/weather_app.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Tutorial - PESITM'),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                  _navigateTo('counter', context);
                },
                title: const Text('Counter App'),
              ),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                  _navigateTo('weather', context);
                },
                title: const Text('Weather App'),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(100),
          child: Wrap(
            spacing: 50,
            runSpacing: 50,
            children: [
              ElevatedButton(
                  onPressed: () => _navigateTo('counter', context),
                  child: const Text('Counter App')),
              ElevatedButton(
                  onPressed: () => _navigateTo('weather', context),
                  child: const Text('Weather App')),
            ],
          ),
        ));
  }

  void _navigateTo(String page, BuildContext context) {
    switch (page) {
      case 'counter':
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CounterApp(),
            ));
        break;
      case 'weather':
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const WeatherApp(),
            ));
        break;
    }
  }
}
