import 'package:flutter/material.dart';
import '../pages/home_page.dart';
import '../pages/counter_page.dart';
import '../pages/contacts_page.dart';
import '../pages/meteo_page.dart';
import '../pages/gallery_page.dart';

class MenuEntry {
  final String title;
  final String route;
  final IconData icon;

  const MenuEntry(this.title, this.route, this.icon);
}

class GlobalParameters {
  static final Map<String, WidgetBuilder> routes = {
    '/': (context) => const HomePage(),
    '/counter': (context) => const CounterPage(),
    '/contacts': (context) => const ContactsPage(),
    '/meteo': (context) => const MeteoPage(),
    '/gallery': (context) => const GalleryPage(),
  };

  static const List<MenuEntry> menus = [
    MenuEntry('Home', '/', Icons.home),
    MenuEntry('Counter', '/counter', Icons.exposure),
    MenuEntry('Contacts', '/contacts', Icons.contacts),
    MenuEntry('Meteo', '/meteo', Icons.cloud),
    MenuEntry('Gallery', '/gallery', Icons.photo_library),
  ];
}
