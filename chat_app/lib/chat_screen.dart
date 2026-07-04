import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart'; // Add this import

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> _messages = [];
  final List<ChatUser> _typingUsers = [];

  // Define the users
  final ChatUser currentUser = ChatUser(id: '1', firstName: 'You');
  final ChatUser chatAI = ChatUser(id: '2', firstName: 'Groq AI');

  // Pull the key dynamically from the .env file instead of hardcoding it
  final String groqApiKey = dotenv.env['OPENROUTER_API_KEY'] ?? 'API_KEY_NOT_FOUND'; 
  final String groqApiUrl = "https://openrouter.ai/api/v1/chat/completions";

  Future<void> getChatAIResponse(ChatMessage m) async {
    setState(() {
      _messages.insert(0, m);
      _typingUsers.add(chatAI); // Show typing indicator
    });

    // Format chat history for the Groq API payload
    List<Map<String, String>> messageHistory = _messages.reversed.map((msg) {
      return {
        "role": msg.user.id == currentUser.id ? "user" : "assistant",
        "content": msg.text,
      };
    }).toList();

    try {
      final response = await http.post(
        Uri.parse(groqApiUrl),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $OPENROUTER_API_KEY", // Safely using the injected key
        },
        body: jsonEncode({
          "model": "meta-llama/llama-3.2-3b-instruct", 
          "messages": [
        {
          "role": "system",
          "content": "You are a helpful AI assistant;"
        },
        {
          "role": "user",
          "content": "Hello, who won the world cup 2022 ?"
        }
      ]
        }),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final aiResponseText = responseData['choices'][0]['message']['content'];

        setState(() {
          _messages.insert(
            0,
            ChatMessage(
              user: chatAI,
              createdAt: DateTime.now(),
              text: aiResponseText,
            ),
          );
        });
      } else {
        debugPrint("Error: ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      debugPrint("Exception caught: $e");
    } finally {
      setState(() {
        _typingUsers.remove(chatAI); // Hide typing indicator
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Groq AI Chat',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: DashChat(
        currentUser: currentUser,
        typingUsers: _typingUsers,
        messageOptions: const MessageOptions(
          currentUserContainerColor: Colors.blueGrey,
          containerColor: Color.fromARGB(255, 230, 230, 230),
        ),
        onSend: (ChatMessage m) {
          getChatAIResponse(m);
        },
        messages: _messages,
      ),
    );
  }
}