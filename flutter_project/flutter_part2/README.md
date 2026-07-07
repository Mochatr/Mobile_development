# flutter_part2

Suite du cours "Introduction a Flutter" (partie 2) : POO en Dart, package `http` et JSON, SQLite/`sqflite`, gestion d'etat et navigation/routing.

Base sur le nouveau support de cours et sur `Dart_examples.docx` (exemples de classes, heritage, polymorphisme).

## synthesis_app

Application de synthese sur la navigation nommee (`Navigator.pushNamed`) et le `Drawer` partage entre pages.

- **HomePage** : page d'accueil.
- **CounterPage** (`StatefulWidget`) : compteur incrementable/decrementable.
- **ContactsPage**, **MeteoPage**, **GalleryPage** : listes/grille de donnees statiques.
- `GlobalParameters` centralise les routes et les entrees du menu, consommees par `MyDrawer`.

Pour lancer :
```
cd flutter_project/flutter_part2/synthesis_app
flutter run
```

## dart_oop_examples

Exemples Dart console (issus de `Dart_examples.docx` et du support de cours) : classes/constructeurs, heritage/polymorphisme, gestion des erreurs.

Pour lancer :
```
cd flutter_project/flutter_part2/dart_oop_examples
dart run bin/classes_constructors.dart
dart run bin/inheritance_polymorphism.dart
dart run bin/error_handling.dart
```
