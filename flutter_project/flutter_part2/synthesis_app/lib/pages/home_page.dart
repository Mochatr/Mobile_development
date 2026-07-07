import 'package:flutter/material.dart';
import '../widgets/my_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      drawer: const MyDrawer(),
      body: const Center(child: Text('Ouvre le menu pour naviguer')),
    );
  }
}
