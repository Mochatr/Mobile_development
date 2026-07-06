# Jetpack Compose & Kotlin - Développement Mobile Natif

Ce dossier regroupe les travaux pratiques réalisés dans le cadre du module de Développement Mobile Natif (Android/Kotlin), couvrant la gestion des événements, la navigation entre activités et la consommation d'une API REST.

## 📱 Projets

### EventApp
Application illustrant la gestion des principaux événements Android à travers 6 activités reliées par navigation au swipe (gauche/droite) :

* **Click** et **LongClick** sur un bouton
* **TextChange** sur un champ de saisie
* **OnItemSelected** sur un Spinner
* **OnTouch** avec affichage des coordonnées du doigt
* **CreateContextMenu** (menu contextuel en appui long)
* **OnDateSet** via un `DatePickerDialog`

Code source : [`EventApp`](EventApp)

### MeteoApp
Application météo qui permet de :

* Saisir le nom d'une ville
* Récupérer les prévisions via l'API REST [OpenWeather](https://openweathermap.org/api) (appel HTTP avec Volley, parsing JSON)
* Afficher pour chaque prévision la date, les températures min/max, la pression atmosphérique et l'humidité dans une `ListView` avec adaptateur personnalisé

Code source : [`MeteoApp`](MeteoApp)

## 🛠️ Technologies utilisées

* **Environnement :** Android Studio
* **Langage :** Kotlin
* **Interface :** XML (ConstraintLayout / LinearLayout)
* **Réseau :** Volley + org.json (MeteoApp)
* **Système de build :** Gradle

## 🚀 Installation et exécution

1. Clonez ce dépôt.
2. Ouvrez le sous-dossier du projet voulu (`EventApp` ou `MeteoApp`) directement dans Android Studio (*Open an existing Android Studio project*).
3. Laissez Gradle synchroniser les dépendances (connexion internet requise).
4. **Pour MeteoApp uniquement :** créez un fichier `local.properties` à la racine du projet et ajoutez-y votre propre clé API OpenWeather :
   ```
   OPENWEATHER_API_KEY=votre_cle_api
   ```
   Ce fichier n'est jamais versionné (voir `.gitignore`) ; la clé est injectée au build via `BuildConfig.OPENWEATHER_API_KEY`.
5. Lancez l'application sur un émulateur (API 34/35 recommandé) ou un appareil physique.

## 👨‍💻 Auteur

**Mohamed Chatr**
*Projet réalisé dans le cadre du Master BDCC.*
