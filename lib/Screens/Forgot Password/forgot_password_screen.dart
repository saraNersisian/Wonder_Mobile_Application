import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wonder_flutter/Screens/Login/login_screen.dart';
import 'package:firebase_database/firebase_database.dart';


class ForgotPasswordScreen extends StatefulWidget {
  ForgotPasswordScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {

    final SendRestLinkButton = Material (
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff33BDFF),
      child: MaterialButton(
        //minWidth: MediaQuery.of(context).size.width,
        minWidth:330,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ForgotPasswordScreen(title: 'Forgot Password Page')),);
        },
        child: Text("Send Reset Link",
            textAlign: TextAlign.center,
            style: style.copyWith(
                fontFamily:'ariel',fontSize: 19,color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(

        body: SingleChildScrollView(
        //to make the page fit great
        child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
      child: Column(
        //mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Container(
                child:Text(
                'Forgot Password?',
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
              SizedBox(
                height: 10.0,
                  ),
             Container(
               margin: EdgeInsets.only(left: 35, right: 35, bottom: 10, top: 0),

                  child: Text(
                    "Enter the email address associated with this account. ",
                    style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            color: Color(0xff808080),
                          ),
                    textAlign: TextAlign.center,
                  ),
               ),
              Container(
                margin: EdgeInsets.only(left: 35, right: 35, bottom: 10, top: 60),
                child:
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Color(0xffDDF4FF),
                    labelText: "Email",
                    labelStyle: TextStyle(
                      fontSize: 16,),
                    prefixIcon: Icon(
                      FontAwesomeIcons.solidEnvelope,
                      color: Colors.grey,
                      size:19,
                    ),
                  ),
                ),
              ),
          SizedBox(
            height: 20.0,
          ),
              SendRestLinkButton,
             ],
            ),
           ],
          ),
         ),
        ),
       );
  }
}