import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wonder_flutter/Screens/Forgot Password/forgot_password_screen.dart';
import 'package:wonder_flutter/Screens/Map/main_map_screen.dart';
import 'package:wonder_flutter/Screens/Sign up/signup_screen.dart';
//import 'package:commons/commons.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key, required this.title}) : super(key: key);


  final String title;


  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {


    final loginButton = Material (
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff33BDFF),
      child: MaterialButton(
        //minWidth: MediaQuery.of(context).size.width,
        minWidth: 350,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          FirebaseAuth.instance.signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((value){
              print("Login successfully!");
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainMapScreen(title: 'main map page')),);
          }).catchError((error){
            //print("Login Failed!");
            // errorDialog(
            //             context,
            //             "Wrong Email/Password ",
            //             // negativeText: "Try Again",
            //             // negativeAction: () {},
            //         // positiveText: "Details",
            //        // positiveAction: () {},
            //         //print(error.toString());
            //     );
              }
              );
          },
        child: Text("Log In",
            textAlign: TextAlign.center,
            style: style.copyWith(
                fontFamily:'ariel',fontSize: 19,color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(

      // body: Container(
      //   decoration: BoxDecoration(
      //     image: DecorationImage(
      //     //  image: AssetImage("Image/blue.png"),
      //       image: NetworkImage("https://i.pinimg.com/564x/a8/2f/15/a82f15a713dfce6a3402332d953e3b9b.jpg"),
      //       fit:BoxFit.cover,
      //       colorFilter: ColorFilter.mode(
      //         Colors.black.withOpacity(0.5),
      //         BlendMode.darken,
      //       )
      //     )
      //
      //   ),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.stretch,
      //     children: [
      //       Container(height: 100, width: 100,),
      //     ],
      //   ),
      //
      // ),
        body: SingleChildScrollView(
          //to make the page fit great
            child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

          Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                  children: [

                    Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 50,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    SizedBox(
                      height: 100.0,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35, bottom: 10, top: 10),
                      child:
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Color(0xffDDF4FF),
                          labelText: "Email",
                           prefixIcon: Icon(
                             FontAwesomeIcons.user,
                             color: Colors.grey,
                             size:22,
                           ),
                        ),

                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35, bottom: 10, top: 10),
                      child:
                      TextField(
                        controller: passwordController,
                        obscureText: true, // to hide password
                        decoration: InputDecoration(

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,

                          fillColor: Color(0xffDDF4FF),
                          labelText: "Password",
                          prefixIcon: Icon(
                            FontAwesomeIcons.key,
                            color: Colors.grey,
                            size:22,
                          ),

                        ),
                      ),

                    ),

                    Container(
                      //margin: EdgeInsets.only(right:100.0) ,
                      width: 400.0,
                      height: 40.0,
                    alignment: Alignment.centerRight,
                    child:
                      TextButton(

                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ForgotPasswordScreen(title: 'Forgot Password Page')),);
                        },
                        child:
                        const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Color(0xff808080),
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            //fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                  ),

                  ],
              ),

              SizedBox(
                height: 40.0,
              ),
              loginButton,
              Container(

                margin:EdgeInsets.only(left:100),
                //padding: EdgeInsets.fromLTRB(50,10,0,0),
                child:
                    Row(
                      children: [
                      Text(
                      "Don't have an account?",
                      // textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xff808080),
                        fontFamily: 'Poppins',
                      ),
                    ),

                        TextButton(

                          onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>SignUpScreen(title: 'My Sign Up Page')),);
                            },
                          child:
                          const Text(
                            'SIGN UP',
                            style: TextStyle(
                              color: Color(0xff33BDFF),
                              fontSize: 15,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),

                      ],

                    )
              ),



            ],



          ),
              ],
         ),
        ),
        ),
    );
      }
}