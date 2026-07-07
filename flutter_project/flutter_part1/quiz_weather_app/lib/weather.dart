import 'package:flutter/material.dart';

class DayForecast {
  final String day;
  final String condition;
  final int tempC;
  final IconData icon;

  const DayForecast(this.day, this.condition, this.tempC, this.icon);
}

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  String city = 'Casablanca';

  final forecast = const [
    DayForecast('Lundi', 'Ensoleille', 27, Icons.wb_sunny),
    DayForecast('Mardi', 'Nuageux', 22, Icons.cloud),
    DayForecast('Mercredi', 'Pluie', 18, Icons.umbrella),
    DayForecast('Jeudi', 'Ensoleille', 25, Icons.wb_sunny),
    DayForecast('Vendredi', 'Nuageux', 21, Icons.cloud),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(city)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: const InputDecoration(labelText: 'Ville', border: OutlineInputBorder()),
              onSubmitted: (value) => setState(() => city = value.isEmpty ? city : value),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: forecast.length,
              itemBuilder: (context, index) {
                final day = forecast[index];
                return Card(
                  color: Colors.deepOrangeAccent,
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: ListTile(
                    leading: Icon(day.icon, color: Colors.white, size: 32),
                    title: Text(day.day, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    subtitle: Text(day.condition, style: const TextStyle(color: Colors.white70)),
                    trailing: Text('${day.tempC}°C', style: const TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
