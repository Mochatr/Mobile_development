import 'package:flutter/material.dart';
import '../widgets/my_drawer.dart';

class MeteoPage extends StatelessWidget {
  const MeteoPage({super.key});

  static const forecast = [
    {'day': 'Lundi', 'tempC': 27},
    {'day': 'Mardi', 'tempC': 22},
    {'day': 'Mercredi', 'tempC': 18},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meteo')),
      drawer: const MyDrawer(),
      body: ListView(
        children: [
          for (final day in forecast)
            ListTile(
              leading: const Icon(Icons.cloud),
              title: Text(day['day'] as String),
              trailing: Text('${day['tempC']}°C'),
            ),
        ],
      ),
    );
  }
}
