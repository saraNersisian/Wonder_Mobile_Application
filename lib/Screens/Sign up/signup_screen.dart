

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/text_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wonder_flutter/Screens/Login/login_screen.dart';
import 'package:firebase_database/firebase_database.dart';
//import 'package:commons/commons.dart';
//import 'package:rich_alert/rich_alert.dart';



//commons: ^0.7.8+3

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 17.0);

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var usernameController = TextEditingController();
  var phoneNumberController = TextEditingController();
 // var msgController = TextEditingController();
  //var markerController = TextEditingController();
 // var zipCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Congratulations!'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Your account is created!'),
                //  Text('Please Login now'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('LOGIN'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen(title: 'My Login Page')),);
                },
              ),
            ],
          );
        },
      );
    }

    final SignUpButton = Material (
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff33BDFF),
      child: MaterialButton(
        //minWidth: MediaQuery.of(context).size.width,
        minWidth: 350,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          //firebase authentication
          FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((authResult) {
            print("Successfully signed up! UID: " + authResult.user.uid.toString());

            var userProfile = {
              'uid': authResult.user.uid,
              'username': usernameController.text,
              'email': emailController.text,
              'phone': phoneNumberController.text,
              //'msg': msgController.text,
              //'markerLocation': markerController.text,
              //'zipcode': zipCodeController.text,

            };

          FirebaseDatabase.instance.reference().child("users/" + authResult.user.uid)
            .set(userProfile)
            .then((value){
              print("Successfully created the profile info ");
             }).catchError((error) {

            print("Failed!");

            });

            // showDialog(
            //     context: context,
            //     builder: (BuildContext context) {
            //       return RichAlertDialog( //uses the custom alert dialog
            //         alertTitle: richTitle("Alert title"),
            //         alertSubtitle: richSubtitle("Subtitle"),
            //         alertType: RichAlertType.WARNING,
            //       );
            //     }
            // );
            // successDialog(
            //   context,
            //   "Account created successfully!",
            //   //negativeText: "Try Again",
            //   //negativeAction: () {},
            //   positiveText: "LOGIN",
            //   positiveAction: () {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(builder: (context) =>LoginScreen(title: 'My Login Page')),);
            //   },
            // );
            _showMyDialog();

           // Navigator.pop(context);
          }).catchError((error){
            print("Failed to sign up!");
            print(error.toString());
          });

    // Navigator.push(
    // context,
    // MaterialPageRoute(builder: (context) =>LoginScreen(title: 'My Login Page')),);},

        },
        child: Text("Create Account",
            textAlign: TextAlign.center,
            style: style.copyWith(
                fontFamily:'ariel',fontSize: 19,color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );




    return
        Scaffold(
        //resizeToAvoidBottomInset : false,
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
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
                      height: 80.0,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35, bottom: 10, top: 5),
                      child:
                      TextField(
                        controller: usernameController,
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
                      margin: EdgeInsets.only(left: 35, right: 35, bottom: 10, top: 5),
                      child:
                      TextField(
                        controller: emailController,
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
                      margin: EdgeInsets.only(left: 35, right: 35, bottom: 10, top: 5),
                      child:
                      TextField(
                        obscureText: true,
                        controller: passwordController,
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
                      margin: EdgeInsets.only(left: 35, right: 35, bottom: 10, top: 5),
                      child:
                      TextField(
                        controller: phoneNumberController,
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
                    // Container(
                    //   margin: EdgeInsets.only(left: 35, right: 35, bottom: 0, top: 5),
                    //   child:
                    //
                    //   TextField(
                    //     controller: zipCodeController,
                    //     decoration: InputDecoration(
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(20.0),
                    //         borderSide: BorderSide.none,
                    //       ),
                    //       filled: true,
                    //       fillColor: Color(0xffffeec5),
                    //       labelText: "Zip Code",
                    //       // prefixIcon: Icon(
                    //       //   FontAwesomeIcons.solidEnvelope,
                    //       //   color: Colors.grey,
                    //       //   size:22,
                    //       // ),
                    //     ),
                    //
                    //   ),
                    //
                    // ),
                    SizedBox(
                      height: 40.0,
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
                              color: Color(0xff808080),
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
                                fontFamily: 'Poppins',
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
          )


    ),
        );
  }
}
