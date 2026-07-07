import 'package:flutter/material.dart';
import '../widgets/my_drawer.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gallery')),
      drawer: const MyDrawer(),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 4, mainAxisSpacing: 4),
        itemCount: 12,
        itemBuilder: (context, index) => Container(
          color: Colors.deepOrange.withValues(alpha: 0.2 + (index % 5) * 0.15),
          child: Icon(Icons.image, color: Colors.deepOrange),
        ),
      ),
    );
  }
}
