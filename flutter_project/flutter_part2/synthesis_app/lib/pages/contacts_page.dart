import 'package:flutter/material.dart';
import '../widgets/my_drawer.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  static const contacts = ['Alice', 'Bob', 'Mohamed', 'Youssef'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contacts')),
      drawer: const MyDrawer(),
      body: ListView(
        children: [
          for (final name in contacts)
            ListTile(leading: const Icon(Icons.person), title: Text(name)),
        ],
      ),
    );
  }
}
