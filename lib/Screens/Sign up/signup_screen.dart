import 'package:flutter/material.dart';
import 'package:flutter/src/material/text_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wonder_flutter/Screens/Login/login_screen.dart';
import 'package:firebase_database/firebase_database.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);


  @override
  Widget build(BuildContext context) {

    final SignUpButton = Material (
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff33BDFF),
      child: MaterialButton(
        //minWidth: MediaQuery.of(context).size.width,
        minWidth: 350,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>LoginScreen(title: 'My Login Page')),);
        },
        child: Text("Create Account",
            textAlign: TextAlign.center,
            style: style.copyWith(
                fontFamily:'ariel',fontSize: 19,color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );


    return
        Scaffold(
        resizeToAvoidBottomInset : false,
        body: SingleChildScrollView(


      child: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              SizedBox(
                height: 80.0,
              ),
              Text(
                'Sign Up',
                 style: TextStyle(
                  fontSize: 50,
                  fontFamily: 'Poppins',
                ),
              ),
             SizedBox(
                   height: 50.0,
                 ),
              Container(
                margin: EdgeInsets.only(left: 35, right: 35, bottom: 10, top: 10),
                child:
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Color(0xffffeec5),
                    labelText: "Username",
                    // prefixIcon: Icon(
                    //   FontAwesomeIcons.solidEnvelope,
                    //   color: Colors.grey,
                    //   size:22,
                    // ),
                  ),

                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 35, right: 35, bottom: 10, top: 10),
                child:
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Color(0xffffeec5),
                    labelText: "Email",
                    // prefixIcon: Icon(
                    //   FontAwesomeIcons.solidEnvelope,
                    //   color: Colors.grey,
                    //   size:22,
                    // ),
                  ),

                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 35, right: 35, bottom: 10, top: 10),
                child:
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Color(0xffffeec5),
                    labelText: "Password",
                    // prefixIcon: Icon(
                    //   FontAwesomeIcons.solidEnvelope,
                    //   color: Colors.grey,
                    //   size:22,
                    // ),
                  ),

                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 35, right: 35, bottom: 10, top: 10),
                child:
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Color(0xffffeec5),
                    labelText: "Phone Number",
                    // prefixIcon: Icon(
                    //   FontAwesomeIcons.solidEnvelope,
                    //   color: Colors.grey,
                    //   size:22,
                    // ),
                  ),

                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 35, right: 35, bottom: 0, top: 10),
                child:

                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Color(0xffffeec5),
                    labelText: "Address",
                    // prefixIcon: Icon(
                    //   FontAwesomeIcons.solidEnvelope,
                    //   color: Colors.grey,
                    //   size:22,
                    // ),
                  ),

                ),

              ),
              SizedBox(
                height: 80.0,
              ),
              Container(
                child:
                SignUpButton,
              ),

                    Row(

                      mainAxisAlignment: MainAxisAlignment.start,
                      children:  <Widget>[
                        //Expanded(
                          //flex: 2,


                          Container(

                            padding: EdgeInsets.fromLTRB(130,9,0,10),
                            child:
                            Text(

                              "Already have an account ?",
                             // textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),

                       // ),
                      Expanded(
                        flex: 0,

                          child:
                          TextButton(

                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => LoginScreen(title: 'My Login Page')),);
                            },
                            child:
                            const Text(
                                'LOG IN',
                                  style: TextStyle(
                                  color: Color(0xff33BDFF),
                                  fontSize: 14,
                                  //fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                      ),
                      ],




                    ),




            ],
          ),

        ],



    ),
    ),
        );
  }
}