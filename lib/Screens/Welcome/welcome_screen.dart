import 'package:flutter/material.dart';
import 'package:wonder_flutter/Screens/Login/login_screen.dart';
import 'package:wonder_flutter/Screens/Sign up/signup_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wonder',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: WelcomeScreen(title: "Wonder Home Page"),
    );
  }
}

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);



  @override
  Widget build(BuildContext context) {

    final loginButton = Material (
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff33BDFF),
      child: MaterialButton(
        //minWidth: MediaQuery.of(context).size.width,
        minWidth: 400,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen(title: 'My Login Page')),);
        },
        child: Text("Sign In",
            textAlign: TextAlign.center,
            style: style.copyWith(
                fontFamily:'poppins',fontSize: 20,color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final SignUpButton = Material (
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      //color: Color(0xff01A0C7),
      color: Color(0xff33BDFF),
      child: MaterialButton(
        minWidth: 400,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>SignUpScreen(title: 'My Sign Up Page')),);
        },
        child: Text("Sign Up",
            textAlign: TextAlign.center,
            style: style.copyWith(
                fontFamily:'poppins',fontSize: 20,color: Colors.white, fontWeight: FontWeight.bold)),
      ),

    );

    return Scaffold(
      body:

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(

            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [

              Text(
                'W',
                style: TextStyle(
                  fontSize: 150,
                  fontFamily: 'Poppins',
                ),
              ),
              Text(
                'Wonder',
                style: TextStyle(
                  fontSize: 50,
                  fontFamily: 'Poppins',
                ),
              ),
              SizedBox(
                height: 200.0,
              ),

              loginButton, //defined above

              SizedBox(
                height: 15.0,
              ),

              SignUpButton,   //defined above

              SizedBox(
                height: 15.0,
              ),

            ], //column children
          ),
        ], //row children
      ),
    );
  }
}
