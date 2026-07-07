import 'package:flutter/material.dart';
import '../widgets/my_drawer.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      drawer: const MyDrawer(),
      body: Center(
        child: Text('Counter Value => $counter', style: const TextStyle(fontSize: 22)),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'btn1',
            onPressed: () => setState(() => --counter),
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 20),
          FloatingActionButton(
            heroTag: 'btn2',
            onPressed: () => setState(() => ++counter),
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
