import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import './chat_screen.dart';
import './login_screen.dart';
import 'api/firebase_api.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseApi().initNotification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final navigatorKey =  GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Rasa Chatbot',
      home:  LoginScreen()
    );
  }
}