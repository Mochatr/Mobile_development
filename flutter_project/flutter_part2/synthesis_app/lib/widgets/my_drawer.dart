import 'package:flutter/material.dart';
import '../global/global_parameters.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.deepOrange),
            child: Center(
              child: Text('Synthesis App', style: TextStyle(color: Colors.white, fontSize: 22)),
            ),
          ),
          for (final menu in GlobalParameters.menus)
            ListTile(
              leading: Icon(menu.icon, color: Colors.deepOrange),
              title: Text(menu.title),
              trailing: const Icon(Icons.arrow_right),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, menu.route);
              },
            ),
        ],
      ),
    );
  }
}
