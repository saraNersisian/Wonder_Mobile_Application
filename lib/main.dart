// @dart=2.9
import 'package:flutter/material.dart';
import 'Screens/Welcome/welcome_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return MaterialApp(
      title: 'Wonder App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,




      ),

      home: WelcomeScreen(title: "Welcome Screen",),
    );
  }
}