import 'package:flutter/material.dart';


class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:
      Row(

        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              SizedBox(
                height: 150.0,
              ),
              Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 50,
                  fontFamily: 'Poppins',
                ),
              ),

            ],
          ),

        ]



    ),
    );
  }
}