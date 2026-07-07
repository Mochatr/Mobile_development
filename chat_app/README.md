# chat_app

Mini chat IA base sur `dash_chat_2` et l'API OpenRouter (`https://openrouter.ai/api/v1/chat/completions`).

## Configuration

1. Copier `.env.example` vers `.env` :
   ```
   cp .env.example .env
   ```
2. Renseigner ta cle API OpenRouter dans `.env` :
   ```
   OPENROUTER_API_KEY=sk-or-...
   ```
3. Lancer l'application :
   ```
   flutter run
   ```

Le modele utilise par defaut est `meta-llama/llama-3.2-3b-instruct:free` (gratuit sur OpenRouter). Si la cle est absente, l'app affiche un message d'erreur dans le chat au lieu d'echouer silencieusement.
