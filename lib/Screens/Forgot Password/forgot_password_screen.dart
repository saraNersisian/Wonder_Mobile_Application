import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wonder_flutter/Screens/Login/login_screen.dart';


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
        minWidth: 400,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ForgotPasswordScreen(title: 'Forgot Password Page')),);
        },
        child: Text("Send Reset Link",
            textAlign: TextAlign.center,
            style: style.copyWith(
                fontFamily:'ariel',fontSize: 23,color: Colors.white, fontWeight: FontWeight.bold)),
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
      body:


      Column(
        //mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Column(
            children: [

              Container(
                child:Text(
                'Forgot Password?',
                style: TextStyle(
                  fontSize: 40,
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

                      fontSize: 17,
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
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Color(0xffDDF4FF),
                    labelText: "Email",
                    prefixIcon: Icon(
                      FontAwesomeIcons.solidEnvelope,
                      color: Colors.grey,
                      size:22,
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
    );
  }
}