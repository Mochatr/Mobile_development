import 'package:flutter/material.dart';
import 'quiz.dart';
import 'weather.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz & Weather',
      theme: ThemeData(colorSchemeSeed: Colors.orange, useMaterial3: true),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.orange),
              child: Center(
                child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
              ),
            ),
            ListTile(
              title: const Text('Quiz'),
              trailing: const Icon(Icons.arrow_right),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (_) => const QuizPage()));
              },
            ),
            ListTile(
              title: const Text('Weather'),
              trailing: const Icon(Icons.arrow_right),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (_) => const WeatherPage()));
              },
            ),
          ],
        ),
      ),
      body: const Center(child: Text('Ouvre le menu pour choisir une application')),
    );
  }
}
