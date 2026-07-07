# Flutter Project

Reproductions et ameliorations des applications du support de cours "Introduction a Flutter".

## Applications

### quiz_weather_app

Application de navigation avec `Drawer`, illustrant la difference entre `StatelessWidget` et `StatefulWidget`.

- **Quiz** (`StatefulWidget`) : questions/reponses avec score, decompose en widgets `Question`, `Answer`, `Score`.
- **Weather** (`StatefulWidget`) : liste de previsions meteo (donnees simulees, pas d'appel reseau requis).

Ameliorations par rapport au support original :
- Migration vers Material 3 et widgets non depreciés (`ElevatedButton` au lieu de `RaisedButton`/`FlatButton`).
- Decomposition du Quiz en sous-widgets des le depart.
- Null-safety et typage strict.

Pour lancer :
```
cd flutter_project/quiz_weather_app
flutter run
```
