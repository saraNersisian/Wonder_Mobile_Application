import 'package:flutter/material.dart';
import 'Screens/Welcome/welcome_screen.dart';
import 'package:firebase_database/firebase_database.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wonder App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,

      ),
      home: WelcomeScreen(title: "Welcome Screen",),
    );
  }
}