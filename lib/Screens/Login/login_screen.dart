import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  @override
  Widget build(BuildContext context) {
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
      body:Column(

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
                  height: 150.0,
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
                      fillColor: Color(0xffDDF4FF),
                      labelText: "Email",
                      // prefixIcon: Icon(
                      //   FontAwesomeIcons.solidEnvelope,
                      //   color: Colors.white,
                      //   size:12,
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
                      fillColor: Color(0xffDDF4FF),
                      labelText: "Password",

                    ),
                  ),


                ),

              ],
          ),

        ],



      ),

    );
  }
}