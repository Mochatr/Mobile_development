import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'chat_screen.dart'; 

Future<void> main() async {
  // Ensure Flutter binding is initialized before loading assets
  WidgetsFlutterBinding.ensureInitialized();
  
  // Load the environment file
  await dotenv.load(fileName: ".env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Groq Chat App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        useMaterial3: true,
      ),
      home: const ChatScreen(), // Set ChatScreen as the home interface
    );
  }
}